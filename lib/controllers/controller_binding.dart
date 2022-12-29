import 'package:get/get.dart';

import 'cmc.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConnectionManagerController>(
        () => ConnectionManagerController());
  }
}
