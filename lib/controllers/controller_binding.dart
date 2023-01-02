import 'package:get/get.dart';
import 'package:sonic_patti/controllers/home_controller.dart';

import 'cmc.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConnectionManagerController>(
        () => ConnectionManagerController());

    Get.lazyPut<HomeController>(() => HomeController());
  }
}
