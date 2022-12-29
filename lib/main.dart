import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sonic_patti/views/gameScreens/gameboard.dart';
import 'package:sonic_patti/views/splashscreen.dart';
import 'controllers/controller_binding.dart';
import 'firebase_options.dart';
import 'views/obscreen/screen_one.dart';

bool? initFirst;

/* Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}
 */
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final fcmToken = await FirebaseMessaging.instance.getToken();
  await GetStorage.init();
  initFirst = GetStorage().read('initFirst');
  GetStorage().write('IS_DARK_MODE', true);
  GetStorage().write('fcmToken', fcmToken ?? false);
  //FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

Color brandColor = const Color(0xffAA8F00);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
        builder: (ColorScheme? lightDynamic, ColorScheme? dark) {
      ColorScheme lightColorScheme;
      ColorScheme darkColorScheme;

      if (lightDynamic != null && dark != null) {
        lightColorScheme = lightDynamic.harmonized()..copyWith();
        lightColorScheme = lightDynamic.copyWith(secondary: brandColor);

        darkColorScheme = lightDynamic.harmonized();
        darkColorScheme = lightDynamic.copyWith(secondary: brandColor);
      } else {
        lightColorScheme = ColorScheme.fromSeed(
            seedColor: brandColor, brightness: Brightness.dark);
        darkColorScheme = ColorScheme.fromSeed(
            seedColor: brandColor, brightness: Brightness.light);
      }

      return GetMaterialApp(
          initialBinding: ControllerBinding(),
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: lightColorScheme,
          ),
          darkTheme: ThemeData.dark()
              .copyWith(useMaterial3: true, colorScheme: darkColorScheme),
          themeMode: ThemeMode.system,
          home: AnimatedSplashScreen(
              duration: 1000,
              splashIconSize: 90,
              splash: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: const Image(
                    width: 90,
                    height: 90,
                    image: AssetImage("assets/icon/logo_sonic.png")),
              ),
              nextScreen: openApp(), //const MainScreen(),
              splashTransition: SplashTransition.fadeTransition,
              backgroundColor: Colors.yellow));
    });
  }

  openApp() {
    return initFirst != true
        ? OnboardingScreenOne()
        : const GameBoard(
            /* title: 'Test App', */
            );
  }
}
