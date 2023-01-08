import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:sonic_patti/models/bids_modal.dart';
import 'package:sonic_patti/models/games_model.dart';

import '../models/catagory_model.dart';
import '../services/api.dart';

class HomeController extends GetxController {
  RxBool permissions = false.obs;
  var tabIndex = 0.obs;
  ScrollController scrollController = ScrollController();
  RxBool isVisible = true.obs;

  var catLists = <Catlists>[].obs;
  var isDataProcessing = false.obs;
  var gameLists = <GameLists>[].obs;
  var isGameDataProcessing = false.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  @override
  void onInit() {
    fetchCatagories();
    super.onInit();
  }

  @override
  void onReady() {
    scrollCtlr();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }

  scrollCtlr() {
    scrollController.addListener(() {
      final ScrollDirection direction =
          scrollController.position.userScrollDirection;
      if (direction == ScrollDirection.forward) {
        isVisible.value = true;
      } else if (direction == ScrollDirection.reverse) {
        isVisible.value = false;
      }
    });
  }

  void fetchCatagories() async {
    try {
      isDataProcessing(true);
      var cats = await RemoteApi.fetchCatagory('game_cat', 'monday');
      catLists.clear();
      if (cats != null) {
        isDataProcessing(false);
        catLists.assignAll(cats);
      }
    } finally {
      isDataProcessing(false);
    }
  }

  void gameRefresh() {
    gameLists.refresh(); //clear();
  }

  void fetchGameLists(String? catId) async {
    // gameLists.clear();
    try {
      isGameDataProcessing(true);
      var games =
          await RemoteApi.fetchGameLists('game_list', 'saturday', catId!);
      gameLists.clear();
      gameLists.refresh();
      if (games != null) {
        isGameDataProcessing(false);
        gameLists.assignAll(games);
      }
    } finally {
      isGameDataProcessing(false);
    }
  }
}
