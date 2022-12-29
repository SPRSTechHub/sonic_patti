import 'package:get/get.dart';

class AnimateController extends GetxController {
  RxBool animate = false.obs;
  RxBool visible = false.obs;

  Future startAnim() async {
    await Future.delayed(const Duration(
      milliseconds: 300,
    ));
    animate.value = true;
  }

  @override
  void onReady() {
    startFadeIn();
    super.onReady();
  }

  Future startFadeIn() async {
    await Future.delayed(const Duration(
      milliseconds: 300,
    ));
    visible.value = true;
  }
}
