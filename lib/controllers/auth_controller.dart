import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/api.dart';
import '../utils/constants.dart';

class AuthController extends GetxController {
  var isLogin = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<dynamic> signInFunction(
      String? mobile, String? password, String? token) async {
    try {
      var getLogin =
          await RemoteApi.signInCall('login', mobile, password, token);
      if (getLogin != null) {
        if (getLogin['status'] == 1) {
          Get.snackbar('Error!', getLogin['message'],
              backgroundColor: Colors.black38,
              icon: const Icon(Icons.error),
              duration: const Duration(seconds: 5));
          return false;
        } else if (getLogin['status'] == 0) {
          Get.snackbar('Success!', getLogin['message'],
              backgroundColor: Get.isDarkMode
                  ? ThemeData.dark().colorScheme.inverseSurface
                  : ThemeData.light().colorScheme.onBackground,
              icon: const Icon(Icons.check),
              colorText: Get.isDarkMode
                  ? ThemeData.dark().colorScheme.surface
                  : ThemeData.light().colorScheme.surface,
              duration: const Duration(seconds: 5));
          Constant.box.write('isLogin', true);
          Constant.box.write('imgurl', getLogin['result']['imgurl']);
          Constant.box.write('mobile', getLogin['result']['mobile'] ?? mobile);
          Constant.box.write('userid', getLogin['result']['userid'] ?? mobile);
          Constant.box.write('uwbal', getLogin['result']['bal'] ?? 0);
          print(Constant.box.read('uwbal'));
          return true;
        } else {
          Get.snackbar('Error!', 'Try again later',
              backgroundColor: ThemeData.dark().colorScheme.error,
              icon: const Icon(Icons.error),
              duration: const Duration(seconds: 5));
          return false;
        }
      }
    } finally {}
  }

  Future<dynamic> signUpFunction(
      fullname, mobile, password, referid, token) async {
    try {
      //isDataProcessing(true);
      var response = await RemoteApi.signUpCall(
          'signup', mobile, password, fullname, referid, token);
      if (response != null) {
        return response;
      }
    } finally {
      //isDataProcessing(false);
    }
  }
}
