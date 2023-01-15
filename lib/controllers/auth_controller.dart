import 'package:get/get.dart';

import '../services/api.dart';
import '../utils/constants.dart';

class AuthController extends GetxController {
  var isLogin = false.obs;

  @override
  void onInit() {
    print(Constant.box.read('fcmToken'));
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void signInFunction(String? fullname, String? mobile, String? password,
      String? referid, String? token) async {
    try {
      var games = await RemoteApi.signInCall(
          'signup', mobile, password, fullname, referid, token);
      if (games != null) {
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
          'sugnup', mobile, password, fullname, referid, token);

      if (response != null) {
        //isDataProcessing(false);
        return response;
      }
    } finally {
      //isDataProcessing(false);
    }
  }
}
