import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonic_patti/controllers/pymnt_controller.dart';
import 'package:sonic_patti/utils/constants.dart';
import 'package:badges/badges.dart' as badges;
import 'package:sonic_patti/views/pymnts/csfr_screen.dart';

class PaymentMethods extends StatefulWidget {
  PaymentMethods({super.key, required this.amount});
  int amount;

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  final PaymentController paymentController = Get.find<PaymentController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(4.0),
              width: Get.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Amount Payable : Rs ${widget.amount}',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.kAtmCardTitle,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.snackbar('Status', 'Comming Soon ....',
                          snackPosition: SnackPosition.BOTTOM);
                    },
                    child: Text(
                      'Apply Coupan',
                      style:
                          AppTextStyles.kBetTextHeading.copyWith(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              'SELECT PAYMENT MODE',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'Inter',
                  fontSize: 14,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                  height: 1),
            ),
            Container(
              decoration: AppStyles.subGametopTimeBG,
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.topLeft,
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(8),
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 60,
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          SizedBox(
                            width: 80,
                            height: 40,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.elliptical(90, 90)),
                              child: Image(
                                  width: 80,
                                  height: 28,
                                  image:
                                      AssetImage("assets/images/upi_logo.png")),
                            ),
                          ),
                          Text(
                            'PAY BY UPI',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Inter',
                                fontSize: 20,
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                          Icon(Icons.arrow_right_alt_outlined,
                              color: Color(0xffE4E0EE)),
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    height: 10,
                    thickness: .5,
                    indent: 0,
                    endIndent: 0,
                    color: Colors.greenAccent,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 60,
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          SizedBox(
                            width: 80,
                            height: 40,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.elliptical(90, 90)),
                              child: Image(
                                  width: 80,
                                  height: 28,
                                  image:
                                      AssetImage("assets/images/nb_logo.png")),
                            ),
                          ),
                          Text(
                            'PAY BY NET BANKING',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Inter',
                                fontSize: 20,
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                          Icon(Icons.arrow_right_alt_outlined,
                              color: Color(0xffE4E0EE)),
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    height: 10,
                    thickness: .5,
                    indent: 0,
                    endIndent: 0,
                    color: Colors.greenAccent,
                  ),
                  GestureDetector(
                    onTap: () async {
                      var amnt = widget.amount;
                      if (amnt > 0) {
                        var resp = paymentController.makePaymentByCsfr(amnt);

                        /*  if (resp == true) {
                          setState(() {
                            Get.to(
                              const CashFreeScreen(),
                              transition: Transition.fadeIn,
                            );
                          });
                        } */
                        ////////////
                        /*  if (Constant.box.read('cf_order_id') != null) {
                          Get.to(const CashFreeScreen());
                        } else {
                          var resp = _payController.makePayment(amnt);
                          if (resp == true) {
                            setState(() {
                              Get.to(
                                const CashFreeScreen(),
                                transition: Transition.fadeIn,
                              );
                            });
                          }
                        } */
                        //////////////
                      }
                    },
                    child: Container(
                      color: Colors.amber,
                      height: 60,
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const SizedBox(
                            width: 80,
                            height: 60,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.elliptical(10, 10)),
                              child: Image(
                                  width: 80,
                                  height: 48,
                                  image:
                                      AssetImage("assets/images/cf_logo.png")),
                            ),
                          ),
                          const Text(
                            'Quick Pay',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Inter',
                                fontSize: 20,
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                          badges.Badge(
                            position:
                                badges.BadgePosition.topEnd(top: -10, end: -20),
                            showBadge: true,
                            ignorePointer: false,
                            onTap: () {},
                            badgeContent: const Icon(Icons.check,
                                color: Colors.white, size: 10),
                            badgeAnimation:
                                const badges.BadgeAnimation.rotation(
                              animationDuration: Duration(seconds: 3),
                              colorChangeAnimationDuration:
                                  Duration(milliseconds: 500),
                              loopAnimation: false,
                              curve: Curves.fastOutSlowIn,
                              colorChangeAnimationCurve: Curves.easeInCubic,
                            ),
                            child: const Icon(Icons.arrow_right_alt_outlined,
                                color: Color(0xffE4E0EE)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    height: 10,
                    thickness: .5,
                    indent: 0,
                    endIndent: 0,
                    color: Colors.greenAccent,
                  ),
                  Container(
                    height: 60,
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        SizedBox(
                          width: 80,
                          height: 40,
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(90, 90)),
                            child: Image(
                                width: 80,
                                height: 28,
                                image:
                                    AssetImage("assets/images/phnp_logo.png")),
                          ),
                        ),
                        Text(
                          'PAY BY PHONPE',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Inter',
                              fontSize: 20,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        ),
                        Icon(Icons.arrow_right_alt_outlined,
                            color: Color(0xffE4E0EE)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12.0),
              padding: const EdgeInsets.all(12.0),
              width: Get.width,
              height: 150,
              decoration: AppStyles.subGametopTimeBG,
              child: const Text('Payment Disclaimers'),
            ),
            const SizedBox(
              height: 70,
            ),
          ],
        ),
      ),
    );
  }
}
