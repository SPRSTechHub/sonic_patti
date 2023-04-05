import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sonicpattilive/utils/constants.dart';
import 'package:sonicpattilive/views/gameScreens/gameboard.dart';
import 'package:sonicpattilive/views/notifications.dart';
import 'package:sonicpattilive/views/splashscreen.dart';
import 'package:sonicpattilive/views/users/login.dart';
import 'controllers/controller_binding.dart';
import 'firebase_options.dart';
import 'utils/color_schemes.g.dart';
import 'views/obscreen/screen_one.dart';

bool? initFirst;
bool? isLogin;
final remoteConfig = FirebaseRemoteConfig.instance;

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
  LocalNotification.initialize();
  FirebaseMessaging.onMessage.listen(
    (RemoteMessage message) {
      if (message.notification != null) {
        LocalNotification.showNotification(message);
      }
    },
  );
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final fcmToken = await FirebaseMessaging.instance.getToken();
  await GetStorage.init();
  initFirst = GetStorage().read('initFirst');
  if (Constant.box.read('IS_DARK_MODE') == null) {
    Get.isDarkMode
        ? GetStorage().write('IS_DARK_MODE', false)
        : GetStorage().write('IS_DARK_MODE', true);
  }

  // Get server apilink //
  if (Constant.box.read('apiUrl') == null) {
    var data = await remoteConfig.setDefaults(const {
      "apiUrl": 'https://console.ulibaba.store',
    });
    await remoteConfig.fetchAndActivate();
    try {
      await remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(hours: 4),
        minimumFetchInterval: Duration.zero,
      ));
      await remoteConfig.fetchAndActivate();
    } on PlatformException catch (exception) {
      print(exception);
    }
    var apiUrl = remoteConfig.getString("apiUrl");
    //print(apiUrl);
    GetStorage().write('apiUrl', apiUrl);
  }

  GetStorage().write('fcmToken', fcmToken ?? false);
  getWalp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(Phoenix(child: MyApp()));
}

void getWalp() {
  Constant.box.read('subfolder') ?? Constant.mbox.write('subfolder', 'basic');
  /*  if (Constant.box.read('subfolder') == null) {
    Constant.mbox.write('subfolder', 'pro');
  } else {
    Constant.mbox.write('subfolder', 'basic');
  } */
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ControllerBinding(),
      debugShowCheckedModeBanner: false,
      title: 'Sonic Patti',
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      themeMode: ThemeMode.system,
      home: openApp(),
    );
  }

  openApp() {
    if (Constant.box.read('isLogin') == true) {
      return const MainScreen();
    } else {
      return initFirst != true ? OnboardingScreenOne() : const LoginScreen();
    }
  }
}
