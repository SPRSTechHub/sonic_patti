import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sonic_patti/controllers/controller_binding.dart';
import 'package:sonic_patti/models/pg_model.dart';
import 'package:sonic_patti/models/transactions.dart';
import 'package:sonic_patti/services/api.dart';
import 'package:sonic_patti/utils/constants.dart';
import 'package:sonic_patti/views/pymnts/upiindia.dart';
import 'package:sonic_patti/views/gameScreens/gameboard.dart';
import 'package:sonic_patti/views/pymnts/csfr_screen.dart';

class PaymentController extends GetxController {
  var pgLists = <Onlinemod>[].obs;
  var offPGLists = <Offlinemod>[].obs;
  var isDataProcessing = false.obs;
  var cday = DateFormat('EEEE').format(currentTime).obs;
  var paynotice = '';
  //transactions vars
  var isTransProcessing = false.obs;
  var transactionsList = <TransactionsClass>[].obs;
  var isODTransProcessing = false.obs;
  var odTransactionsList = <OflDepoModel>[].obs;
  var isOfferProcessing = false.obs;
  var offerLists = <Payoffer?>[].obs;

  /* void fetchOffers() async {
    try {
      isOfferProcessing(true);
      var offers = await RemoteApi.fetchOffers('get_offers', '1231231230');
      offerLists
          .clear(); /* 
      print(offers!.notices);
      print(offers.result); */
      if (offers!.result != null) {
        isOfferProcessing(false);
        offerLists.assignAll(offers.result);
      }
    } finally {
      isOfferProcessing(false);
    }
  } */

//makePayment
  Future<dynamic> makePaymentByAllUpi(amount, String? pgMod) async {
    String? mobile = Constant.box.read('mobile');
    final token = Constant.box.read('fcmToken') ?? false;

    if (amount != null && mobile != null && pgMod == 'upiindia_pg') {
      var createOrder = await RemoteApi.createPymntOrder('add_money_upiinda',
          mobile, amount.toString(), 'credit', 'upiindia_pg', token);
      if (createOrder != null) {
        if (createOrder['status'] == 0) {
          if (createOrder['data'] != '') {
            double amnt = amount.toDouble();
            Get.to(
              AllUpi(
                  receiverUpiId: createOrder['data']['receiverUpiId'],
                  receiverName: createOrder['data']['receiverName'],
                  transactionRefId: createOrder['data']['ord_id'],
                  transactionNote: createOrder['data']['transactionNote'],
                  amount: amnt),
              transition: Transition.fadeIn,
            );
            return true;
          } else {
            return false;
          }
        }
      }
    } else if (amount != null && mobile != null && pgMod == 'csfr_pg') {
      var r = makePaymentByCsfr(amount);
    }
  }

  Future<dynamic> successCallBack(
      ordId, amount, txnId, resCode, txnRef, approvalRef, String s) async {
    var mob = Constant.box.read('mobile');
    var statusUpdate = await RemoteApi.chkPymntOrder('vrf_money_upiinda', mob,
        ordId, amount, txnId, resCode, txnRef, approvalRef);
    if (statusUpdate != null) {
      if (statusUpdate['status'] == 0) {
        Get.to(
          const GameBoard(),
          binding: ControllerBinding(),
          transition: Transition.fadeIn,
        );
        return true;
      } else {
        return false;
      }
    }
  }

  Future<dynamic> makePaymentByCsfr(amount) async {
    String? mobile = Constant.box.read('mobile');
    final token = Constant.box.read('fcmToken') ?? false;

    if (amount != null && mobile != null) {
      var createOrder = await RemoteApi.createPymntOrder('add_money_csfr',
          mobile, amount.toString(), 'credit', 'upiapi', token);
      if (createOrder != null) {
        if (createOrder['status'] == 0) {
          if (createOrder['data'] != '') {
            Get.to(
              CashFreeScreen(
                  orderId: createOrder['data']['order_id'],
                  paymentSessionId: createOrder['data']['payment_session_id']),
              transition: Transition.fadeIn,
            );
            return true;
          } else {
            return false;
          }
        }
      }
    }
  }

  Future<dynamic> makePaymentOffline(amount, image, token) async {
    var date = DateFormat('dd-MM-yyyy').format(DateTime.now());
    var mob = Constant.box.read('mobile');
    var trno = mob + DateFormat('HHms').format(DateTime.now());
    var statusUpdate = await RemoteApi.makePaymentOffline(
        'add_money_offline', mob, date, trno, amount, image, token);
    if (statusUpdate != null) {
      if (statusUpdate['status'] == 0) {
        Get.snackbar('Status',
            'Your image uploaded successfully, Wait for few minutes to check from our end',
            snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
        return true;
      } else if (statusUpdate['status'] == 1) {
        Get.snackbar('Status', statusUpdate['message'],
            snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
        return true;
      } else {
        Get.snackbar('Status', 'System Error!',
            snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
        return false;
      }
    }
  }

//get Bids Lists
  fetchTransactionDetails(String mobile, String? sortBy, String? sortTo,
      String? lstart, String? lend) async {
    try {
      isTransProcessing(true);
      var allBids = await RemoteApi.fetchTransactionDetails(
          'trans_history', mobile, sortBy, sortTo, lstart, lend);
      transactionsList.clear();
      transactionsList.refresh();
      if (allBids != null) {
        isTransProcessing(false);
        transactionsList.assignAll(allBids);
      }
    } finally {
      isTransProcessing(false);
    }
  }

  fetchOfflineTrDetails(String mobile) async {
    try {
      isODTransProcessing(true);
      var transactions = await RemoteApi.fetchOFLDTransactionDetails(
          'offline_history', mobile);
      odTransactionsList.clear();
      odTransactionsList.refresh();
      if (transactions != null) {
        isODTransProcessing(false);
        odTransactionsList.assignAll(transactions);
      }
    } finally {
      isODTransProcessing(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    fetchPmtMethod();
    super.onReady();
  }

  fetchPmtMethod() async {
    try {
      isDataProcessing(true);
      var methods = await RemoteApi.fetchPmtg('pay_methods');

      if (methods != null) {
        paynotice = methods.paynotice.toString();
        if (methods.payoffers != '') {
          offerLists.clear();
          isDataProcessing(false);
          offerLists.assignAll(methods.payoffers);
        }
        if (methods.onlinemod != '') {
          pgLists.clear();
          isDataProcessing(false);
          pgLists.assignAll(methods.onlinemod);
        }
        if (methods.offlinemod != '') {
          offPGLists.clear();
          isDataProcessing(false);
          offPGLists.assignAll(methods.offlinemod);
        }
      }
    } finally {
      isDataProcessing(false);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
