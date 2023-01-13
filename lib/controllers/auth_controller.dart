import 'package:get/get.dart';
import 'package:sonic_patti/utils/constants.dart';

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
}
