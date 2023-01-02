import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:permission_handler/permission_handler.dart';

class ConnectionManagerController extends GetxController {
  late StreamSubscription subscription;
  RxBool isDeviceConnected = false.obs;
  RxBool isAlertSet = false.obs;

  @override
  void onInit() {
    getConnectivity();
    super.onInit();
  }

  @override
  void onReady() {
    getConnectivity();
    requestNotificationPermission();
    super.onReady();
  }

  @override
  void onClose() {
    subscription.cancel();
  }

  getConnectivity() => subscription = Connectivity()
          .onConnectivityChanged
          .listen((ConnectivityResult result) async {
        isDeviceConnected.value =
            await InternetConnectionChecker().hasConnection;
        if (!isDeviceConnected.value && isAlertSet == false) {
          isAlertSet.value = true;
        } else {
          isAlertSet.value = false;
        }
      });

  Future<void> requestNotificationPermission() async {
    final status = await Permission.notification.request();

    if (status == PermissionStatus.granted) {
      requestStoragePermission();
    } else if (status == PermissionStatus.denied) {
      Get.defaultDialog(
        title: "Notification Permission",
        content: const Text('Access Permission Required!'),
        onConfirm: () {
          requestNotificationPermission();
        },
        middleText:
            "Please update permission from App Setting menu from your app",
        barrierDismissible: false,
      );
    } else if (status == PermissionStatus.permanentlyDenied) {
      Get.defaultDialog(
        title: "Notification Permission",
        content: const Text('Access Permission Required!'),
        onConfirm: () async {
          await openAppSettings();
        },
        textConfirm: 'Open Setting',
        middleText:
            "Please update permission from App Setting menu from your app",
        barrierDismissible: false,
      );
    }
  }

  Future<void> requestCameraPermission() async {
    final status = await Permission.camera.request();
    if (status == PermissionStatus.granted) {
      requestStoragePermission();
    } else if (status == PermissionStatus.denied) {
      Get.defaultDialog(
        title: "Camera Permission",
        content: const Text('Access Permission Required!'),
        onConfirm: () {
          requestCameraPermission();
        },
        middleText:
            "Please update permission from App Setting menu from your app",
        barrierDismissible: false,
      );
    } else if (status == PermissionStatus.permanentlyDenied) {
      Get.defaultDialog(
        title: "Camera Permission",
        content: const Text('Access Permission Required!'),
        onConfirm: () async {
          await openAppSettings();
        },
        middleText:
            "Please update permission from App Setting menu from your app",
        barrierDismissible: false,
        textConfirm: 'Open Setting',
      );
      //await openAppSettings();
    }
  }

  Future<void> requestStoragePermission() async {
    final status = await Permission.storage.request();
    if (status == PermissionStatus.granted) {
      requestContactsPermission();
    } else if (status == PermissionStatus.denied) {
      Get.defaultDialog(
        title: "Camera Permission",
        content: const Text('Access Permission Required!'),
        onConfirm: () {
          requestStoragePermission();
        },
        middleText:
            "Please update permission from App Setting menu from your app",
        barrierDismissible: false,
      );
    } else if (status == PermissionStatus.permanentlyDenied) {
      Get.defaultDialog(
        title: "Storage Permission",
        content: const Text('Access Permission Required!'),
        onConfirm: () async {
          await openAppSettings();
        },
        textConfirm: 'Open Setting',
        middleText:
            "Please update permission from App Setting menu from your app",
        barrierDismissible: false,
      );
    }
  }

  Future<void> requestContactsPermission() async {
    final status = await Permission.contacts.request();
    if (status == PermissionStatus.granted) {
      // All permission Granted
    } else if (status == PermissionStatus.denied) {
      Get.defaultDialog(
        title: "Contact Permission",
        content: const Text('Access Permission Required!'),
        onConfirm: () {
          requestContactsPermission();
        },
        textConfirm: 'Open Setting',
        middleText:
            "Please update permission from App Setting menu from your app",
        barrierDismissible: false,
      );
    } else if (status == PermissionStatus.permanentlyDenied) {
      Get.defaultDialog(
        title: "Camera Permission",
        content: const Text('Access Permission Required!'),
        onConfirm: () async {
          await openAppSettings();
        },
        middleText:
            "Please update permission from App Setting menu from your app",
        barrierDismissible: false,
      );
      // await openAppSettings();
    }
  }
}
