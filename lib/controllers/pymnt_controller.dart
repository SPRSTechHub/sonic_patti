import 'package:get/get.dart';
import 'package:sonic_patti/services/api.dart';
import 'package:sonic_patti/utils/constants.dart';
import 'package:sonic_patti/views/pymnts/csfr_screen.dart';

class PaymentController extends GetxController {
  //var cday = DateFormat('EEEE').format(currentTime).obs;

  var isDataProcessing = false.obs;

//makePayment
  Future<dynamic> makePaymentByAllUpi(amount) async {
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
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
