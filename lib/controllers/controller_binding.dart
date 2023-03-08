import 'package:get/get.dart';
import 'package:sonicpattilive/controllers/animCtroller.dart';
import 'package:sonicpattilive/controllers/auth_controller.dart';
import 'package:sonicpattilive/controllers/home_controller.dart';
import 'package:sonicpattilive/controllers/pymnt_controller.dart';

import 'cmc.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConnectionManagerController>(
        () => ConnectionManagerController());
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<PaymentController>(() => PaymentController());
    Get.lazyPut<AnimateController>(() => AnimateController());
  }
}
