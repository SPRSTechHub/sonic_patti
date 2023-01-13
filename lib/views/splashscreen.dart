import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/cmc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ConnectionManagerController _controller =
      Get.find<ConnectionManagerController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() {
          if (_controller.isDeviceConnected.value == false) {
            // showDialogBox();
            return const Text('No Internet');
          } else {
            return const Text('Got Internet');
          }
        }),
      ),
    );
  }

/*   showDialogBox() {
    return Get.defaultDialog(
      title: "Alert",
      content: const Text('data'),
      onConfirm: () {
        //getConnectivity();
      },
      cancelTextColor: bgColor2,
      middleText: "Dialog made in 3 lines of code",
      barrierDismissible: false,
    );
  } */
}
