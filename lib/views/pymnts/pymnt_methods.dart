import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sonic_patti/controllers/pymnt_controller.dart';
import 'package:sonic_patti/services/api.dart';
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
                    style: AppTextStyles.kAtmCardTitle.copyWith(
                        color: Theme.of(context).colorScheme.tertiary),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.snackbar('Status', 'Comming Soon ....',
                          snackPosition: SnackPosition.BOTTOM);
                    },
                    child: Text(
                      'Apply Coupan',
                      style: AppTextStyles.kBetTextHeading.copyWith(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'SELECT PAYMENT MODE',
              textAlign: TextAlign.center,
              style: AppTextStyles.kBetTextHeading.copyWith(
                  color: Theme.of(context).colorScheme.tertiary, fontSize: 12),
            ),
            Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.topLeft,
                child: Obx(() {
                  if (paymentController.isDataProcessing.value == true) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (paymentController.pgLists.isNotEmpty) {
                      return AnimationLimiter(
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: ((context, index) {
                              var pgData = paymentController.pgLists[index];
                              return AnimationConfiguration.staggeredList(
                                position: index,
                                duration: const Duration(milliseconds: 575),
                                delay: const Duration(milliseconds: 175),
                                child: SlideAnimation(
                                  verticalOffset: 50.0,
                                  child: FadeInAnimation(
                                    child: Card(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 6.0),
                                      elevation: 4.0,
                                      color: pgData.pgStatus == '1'
                                          ? Colors.white
                                          : Theme.of(context)
                                              .colorScheme
                                              .tertiary,
                                      child: ListTile(
                                        onTap: () async {
                                          if (pgData.pgStatus == '0') {
                                            var amnt = widget.amount;
                                            if (amnt > 0) {
                                              var resp = paymentController
                                                  .makePaymentByAllUpi(
                                                      amnt, pgData.pgMod);
                                            }
                                          } else {
                                            Get.snackbar(
                                                'Alert', 'Coming soon....',
                                                backgroundColor:
                                                    Colors.redAccent,
                                                snackPosition:
                                                    SnackPosition.BOTTOM);
                                          }
                                        },
                                        splashColor: Colors.redAccent,
                                        leading: SizedBox(
                                          width: 100,
                                          height: 48,
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.elliptical(10, 10)),
                                            child: Image.network(
                                              '${RemoteApi.url}/../uploads/payqr/${pgData.pgUrl}',
                                              fit: BoxFit.fill,
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                return Container(
                                                  color: Colors.amber,
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    pgData.pgName,
                                                    style: const TextStyle(
                                                        fontSize: 12),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        title: Text(
                                          pgData.pgName,
                                          style: AppTextStyles.kSubGameTitle,
                                        ),
                                        trailing: pgData.pgStatus == '1'
                                            ? const Icon(Icons.close_outlined,
                                                color: Color(0xffE4E0EE))
                                            : badges.Badge(
                                                position:
                                                    badges.BadgePosition.topEnd(
                                                        top: -10, end: -20),
                                                showBadge: true,
                                                ignorePointer: false,
                                                onTap: () {},
                                                badgeContent: const Icon(
                                                    Icons.check,
                                                    color: Colors.white,
                                                    size: 10),
                                                badgeAnimation: const badges
                                                    .BadgeAnimation.rotation(
                                                  animationDuration:
                                                      Duration(seconds: 3),
                                                  colorChangeAnimationDuration:
                                                      Duration(
                                                          milliseconds: 500),
                                                  loopAnimation: false,
                                                  curve: Curves.fastOutSlowIn,
                                                  colorChangeAnimationCurve:
                                                      Curves.easeInCubic,
                                                ),
                                                child: const Icon(
                                                    Icons
                                                        .arrow_right_alt_outlined,
                                                    color: Color(0xffE4E0EE)),
                                              ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                            itemCount: paymentController.pgLists.length),
                      );
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Lottie.asset(
                            'assets/anim/loading1.json',
                            fit: BoxFit.fill,
                          ),
                          const Text('Games are loading ....'),
                        ],
                      );
                    }
                  }
                })),
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                  bottomLeft: Radius.circular(14),
                  bottomRight: Radius.circular(14),
                ),
                color: Theme.of(context).colorScheme.tertiary,
              ),
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
