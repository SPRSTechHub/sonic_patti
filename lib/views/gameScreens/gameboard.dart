import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sonicpattilive/controllers/controller_binding.dart';
import 'package:sonicpattilive/controllers/home_controller.dart';
import 'package:sonicpattilive/utils/constants.dart';
import 'package:sonicpattilive/views/components/appbar.dart';
import 'package:sonicpattilive/views/components/navigation.dart';
import 'package:sonicpattilive/views/components/sidenav.dart';
import 'package:sonicpattilive/views/gameScreens/all_games.dart';
import 'package:sonicpattilive/views/gameScreens/allbids.dart';
import 'package:sonicpattilive/views/gameScreens/results.dart';
import 'package:sonicpattilive/views/notifications.dart';
import 'package:sonicpattilive/views/users/mywallet.dart';
import 'package:sonicpattilive/views/users/profileScreen.dart';
import 'package:sonicpattilive/views/users/referearn.dart';
import 'package:url_launcher/url_launcher.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({super.key});
  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  final HomeController _mainController = Get.find<HomeController>();
  final _isVisible = true;
  var appNV = Constant.box.read('appNversion') ?? '';
  var appNB = Constant.box.read('appNbuild') ?? '';

  @override
  void initState() {
    super.initState();
    setState(() {
      _mainController.fetchUserDetails();
      RemoteChecker();
    });
    LocalNotification.initialize();
    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        print("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          LocalNotification.showNotification(message);
          //  print("New Notification");
          // if (message.data['_id'] != null) {
          //   Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (context) => DemoScreen(
          //         id: message.data['_id'],
          //       ),
          //     ),
          //   );
          // }
        }
      },
    );
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        if (message.notification != null) {
          LocalNotification.showNotification(message);
        }
      },
    );
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          LocalNotification.showNotification(message);
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56.0),
        child: TopAppBar(),
      ),
      body: buildBody(),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Theme.of(context).colorScheme.secondary,
        backgroundColor: Theme.of(context).colorScheme.surfaceTint,
        onPressed: () {
          _mainController.fetchCatagories();
          Get.to(const MyWallet(),
              binding: ControllerBinding(),
              transition: Transition.leftToRightWithFade);
        },
        elevation: _isVisible ? 8.0 : null,
        child: const Icon(
          Icons.bolt_outlined,
          size: 24,
          shadows: <Shadow>[
            Shadow(color: Colors.white, blurRadius: 6.0, offset: Offset.zero)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      bottomNavigationBar: nav(),
      drawer: const SideNav(),
    );
  }

  Widget nav() {
    return Obx(
      () => navBar(
          index: _mainController.tabIndex.value,
          isElevated: true,
          isVisible: _mainController.isVisible.value),
    );
  }

  RemoteChecker() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = '${packageInfo.version + '+' + packageInfo.buildNumber}';
    if (version != '${appNV}+${appNB}') {
      print('${appNV}+${appNB}');
      showUpdate();
    }
  }

  Widget buildBody() {
    return Obx(
      () => IndexedStack(
        index: _mainController.tabIndex.value,
        children: [AllGames(), Profile(), AllBids(), Results(), MyReferral()],
      ),
    );
  }

  showUpdate() {
    return showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('New Update Available!'),
          content: const Text('A Newer version of this App\n'
              'is available now\n'
              'Download from www.sprs.store\n'
              'and Enjoy more features.'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Enable'),
              onPressed: () {
                final Uri _url = Uri.parse(
                    Constant.box.read('appLink') ?? 'https://sprs.store');
                print(_url);
                _launchInBrowser(_url);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
