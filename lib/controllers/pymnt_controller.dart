import 'package:get/get.dart';
import 'package:sonic_patti/controllers/controller_binding.dart';
import 'package:sonic_patti/models/pg_model.dart';
import 'package:sonic_patti/services/api.dart';
import 'package:sonic_patti/utils/constants.dart';
import 'package:sonic_patti/views/components/upiindia.dart';
import 'package:sonic_patti/views/gameScreens/gameboard.dart';
import 'package:sonic_patti/views/pymnts/csfr_screen.dart';

class PaymentController extends GetxController {
  var pgLists = <PgmClass>[].obs;
  var isDataProcessing = false.obs;
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
            // Constant.box.write('receiverUpiId',createOrder['data']['receiverUpiId']);
            // Constant.box.write('receiverName',createOrder['data']['receiverName']);
            print(createOrder['data']);
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

//

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
      pgLists.clear();
      if (methods != null) {
        isDataProcessing(false);
        pgLists.assignAll(methods);
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
