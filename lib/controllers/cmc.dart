import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sonic_patti/utils/constants.dart';

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
}
