import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sonic_patti/models/bids_modal.dart';
import 'package:sonic_patti/models/games_model.dart';
import 'package:sonic_patti/models/market_ratio.dart';
import 'package:sonic_patti/models/win_model.dart';
import 'package:sonic_patti/utils/constants.dart';
import 'package:sonic_patti/views/users/login.dart';

import '../models/catagory_model.dart';
import '../models/game_offers_model.dart';
import '../services/api.dart';

class HomeController extends GetxController {
  RxBool permissions = false.obs;
  RxBool isLogin = false.obs;
  var tabIndex = 0.obs;
  ScrollController scrollController = ScrollController();
  RxBool isVisible = true.obs;
  var cday = DateFormat('EEEE').format(currentTime).obs;
///////////////////////
  var catLists = <Catlists>[].obs;
  var isDataProcessing = false.obs;
  var gameLists = <GameLists>[].obs;
  var mktList = <MktClass>[].obs;
  var isGameDataProcessing = false.obs;
  var isBidListsProcessing = false.obs;
  var bidsList = <BidsList>[].obs;
  var isWinListsProcessing = false.obs;
  var winList = <WinModal>[].obs;
  var isOfferProcessing = false.obs;
  var offerLists = <Result>[].obs;
  var notices = '';

  void fetchOffers() async {
    try {
      isOfferProcessing(true);
      var offers = await RemoteApi.fetchOffers('get_offers', '1231231230');
      if (offers != null) {
        offerLists.clear();
        notices = offers.notices.toString();
        if (offers.result != null) {
          isOfferProcessing(false);
          offerLists.assignAll(offers.result);
        }
      } else {
        notices = 'No Notice for now';
        offerLists.clear();
        isOfferProcessing(false);
      }
    } finally {
      isOfferProcessing(false);
    }
  }

  final RxList<BidsModal> bids = RxList<BidsModal>([]);
  late BidsModal bidsModal;
  var bid = 0.obs;

  checkLogin() {
    Constant.box.read('isLogin') ?? false;
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

//Scroll Controlling//
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

//check User Balance
  fetchUserDetails() async {
    var uwbal = Constant.box.read('uwbal');
    bool isLogin = Constant.box.read('isLogin');
    String? mobile = Constant.box.read('mobile');
    String? token = Constant.box.read('fcmToken') ?? '';
    if (uwbal != null && isLogin == true && mobile != null) {
      var userDetails = await RemoteApi.getUser('get_user', mobile, token);
      if (userDetails != null) {
        if (userDetails['ckDev'] != 0) {
          Get.rawSnackbar(
            message: 'New Device detected!',
            backgroundColor: Get.isDarkMode
                ? ThemeData.dark().colorScheme.error
                : ThemeData.light().colorScheme.error,
          );
          Constant.box.write('isLogin', false);
          Get.off(LoginScreen());
        } else {
          if (userDetails['status'] == 0) {
            Constant.box.write(
                'uwbal', userDetails['result']['wallet']['bal_amnt'] ?? 0);
            Constant.box.write(
                'referId', userDetails['result']['profile']['refer_id'] ?? '');
            Constant.box.write(
                'fullname', userDetails['result']['profile']['fullname'] ?? '');
            Constant.box.write(
                'minDepo', userDetails['result']['wallet']['minDepo'] ?? 0);
            Constant.box.write('minWithdraw',
                userDetails['result']['wallet']['minWithdraw'] ?? 0);
            // store app details
            Constant.box.write('appNversion',
                userDetails['result']['appdetails']['app_version'] ?? '1.0.0');
            Constant.box.write('appNbuild',
                userDetails['result']['appdetails']['app_build'] ?? 1);
            Constant.box.write('appLink',
                userDetails['result']['appdetails']['app_link'] ?? null);
          }
        }
      }
    }
  }

//getapplink
  fetchAppLink() async {
    String? token = Constant.box.read('fcmToken') ?? '';
    var details = await RemoteApi.getAppLink('getapplink', token);
    print(details);
    if (details != null) {
      if (details['status'] == 0) {
        return details;
      } else {
        return null;
      }
    }
  }

// Check Winnings
  fetchWinining(String catId, String mobile, String? sortBy, String? sortTo,
      String? lstart, String? lend, String? searchKey) async {
    try {
      isWinListsProcessing(true);
      var winnings = await RemoteApi.fetchWinining(
          'win_result', mobile, catId, sortBy, sortTo, lstart, lend);
      winList.clear();
      winList.refresh();
      if (winnings != null) {
        isWinListsProcessing(false);
        winList.assignAll(winnings);
      }
    } finally {
      isWinListsProcessing(false);
    }
  }

//Check Authenticity
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
  }

  get itemsAll => bids;

  Future<dynamic> formSubmit() async {
    if (Constant.box.read('matchID') != '' &&
        Constant.box.read('betType') != '') {
      if (itemsAll.length > 0) {
        var bidsData = bids.map((item) {
          return {
            "matchId": Constant.box.read('matchId'),
            "betType": Constant.box.read('betType'),
            "mobile": Constant.box.read('mobile'),
            "date": DateFormat('dd-MM-yyyy').format(currentTime),
            "time": DateFormat('HH:mm').format(currentTime),
            "betAmnt": item.bidAmnt,
            "betVal": item.bidNum,
          };
        }).toList();

        String selectedBids = json.encode(bidsData);

        if (selectedBids != null) {
          var resp = await RemoteApi.bidSubmission(selectedBids);
          if (resp['status'] == 0) {
            Get.snackbar('Success!', resp['message'],
                backgroundColor: bottomBarBg,
                icon: const Icon(Icons.check),
                duration: const Duration(seconds: 5));
            Constant.box.write('uwbal', resp['data']['amount']!);
            return true;
          } else {
            Get.snackbar('Alert', resp['message'],
                snackPosition: SnackPosition.BOTTOM,
                duration: const Duration(seconds: 1));
            return false;
          }
        }
        bids.clear();
        bid.value = bids.length;
      } else {
        Get.snackbar('Alert', "No Bids selected!",
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 1));
      }
    } else {
      Get.snackbar('title', 'No data found');
    }
  }

  void changeTabIndex(int index) {
    tabIndex.value = index;
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
      var games = await RemoteApi.fetchGameLists(
          'game_list', cday.toLowerCase(), catId!);
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

  Future<dynamic> fetchMarket(gameId) async {
    try {
      var market = await RemoteApi.fetchMarket('market_ratio', gameId);
      if (market != null) {
        mktList.clear();
        mktList.add(market);
      }
    } finally {
      isGameDataProcessing(false);
    }
  }

  //get Bids Lists
  fetchPlaceBids(String catId, String mobile, String? sortBy, String? sortTo,
      String? lstart, String? lend, String? searchKey) async {
    /*  if(searchKey != ''){

    } */
    try {
      isBidListsProcessing(true);
      var allBids = await RemoteApi.fetchBidLists(
          'bet_history', mobile, catId, sortBy, sortTo, lstart, lend, '');
      bidsList.clear();
      bidsList.refresh();
      if (allBids != null) {
        isBidListsProcessing(false);
        bidsList.assignAll(allBids);
      }
    } finally {
      isBidListsProcessing(false);
    }
  }
}
