import 'dart:async';
import 'dart:convert';

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

  ////////////////////
  final RxList<BidsModal> bids = RxList<BidsModal>([]);
  late BidsModal bidsModal;
  var bid = 0.obs;

  addBid(String bidVal, String bidamnt) {
    final index = bids.indexWhere((element) => element.bidNum == bidVal);
    if (index >= 0) {
      Get.snackbar('Alert', 'Already added',
          duration: const Duration(seconds: 1),
          shouldIconPulse: true,
          backgroundColor: Colors.amber);
    } else {
      bidsModal = BidsModal(bidNum: bidVal, bidAmnt: bidamnt);
      bids.add(bidsModal);
      bid.value = bids.length;
    }
  }

  void removeBids(int index) {
    bids.removeAt(index);
    bid.value = bids.length;
    /*    if (_item.containsKey(item) && _item[item] == 1) {
      _item.removeWhere((key, value) => key == item);
    } else {
      _item[item] -= 1;
    } */

    /*  Get.snackbar('added', "Item : ${item.itemName}",
        snackPosition: SnackPosition.TOP, duration: const Duration(seconds: 1)); */
  }

/*
  void formSubmit() async {
    if (itemsAll.length > 0) {
      var cartData = _item.entries.map((item) {
        return {
          "site_code": Constant.box.read('site_code'),
          "building_code": Constant.box.read('building_code'),
          "itemTitle": item.key.itemName,
          "itemCode": item.key.itemCode,
          "itemQty": item.value,
        };
      }).toList();
      String stringstudents = json.encode(cartData);
      Get.snackbar('Alert', "Data stored successfully!",
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 1));
      //print(stringstudents);
      if (stringstudents != null) {
        //print(stringstudents);
        await RemoteApiService.submitRequisitionForm(stringstudents);
      }
    } else {
      Get.snackbar('Alert', "No Items selected!",
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 1));
    }
  }
*/
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
