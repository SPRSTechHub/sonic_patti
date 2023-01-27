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
              backgroundColor: bottomBarBg,
              icon: const Icon(Icons.check),
              duration: const Duration(seconds: 5));
          // On Successfull Login Update preferences
          Constant.box.write('isLogin', true);
          Constant.box.write('imgurl', getLogin['imgurl']);
          Constant.box.write('mobile', getLogin['mobile'] ?? mobile);
          Constant.box.write('userid', getLogin['userid'] ?? mobile);
          Constant.box.write('uwbal', getLogin['bal'] ?? 0);
          return true;
        } else {
          Get.snackbar('Error!', 'Try again later',
              backgroundColor: Colors.black38,
              icon: const Icon(Icons.error),
              duration: const Duration(seconds: 5));
          return false;
        }
        //    isGameDataProcessing(false);
      }
    } finally {
      //  isGameDataProcessing(false);
    }
  }

  Future<dynamic> signUpFunction(
      fullname, mobile, password, referid, token) async {
    try {
      //isDataProcessing(true);
      var response = await RemoteApi.signUpCall(
          'signup', mobile, password, fullname, referid, token);
      if (response != null) {
        //isDataProcessing(false);
        return response;
      }
    } finally {
      //isDataProcessing(false);
    }
  }
}
