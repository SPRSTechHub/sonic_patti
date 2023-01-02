import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool permissions = false.obs;
  var tabIndex = 0.obs;
  ScrollController scrollController = ScrollController();
  RxBool isVisible = true.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    scrollCtlr();
    super.onReady();
  }

  scrollCtlr() {
    scrollController.addListener(() {
      final ScrollDirection direction =
          scrollController.position.userScrollDirection;
      if (direction == ScrollDirection.forward) {
        //print('show bottombar');
        isVisible.value = true;
      } else if (direction == ScrollDirection.reverse) {
        //print('hide bottombar');
        isVisible.value = false;
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }
}
