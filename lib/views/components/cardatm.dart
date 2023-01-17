import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonic_patti/utils/constants.dart';

class BuildATMCard extends StatelessWidget {
  const BuildATMCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      padding: const EdgeInsets.only(right: 4.0, bottom: 8.0),
      width: Get.width,
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
            begin: Alignment(0.8173059225082397, 0.1653572916984558),
            end: Alignment(-0.1653572916984558, 0.16886486113071442),
            colors: [
              Color.fromRGBO(255, 234, 0, 1),
              Color.fromRGBO(128, 118, 0, 1)
            ]),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        width: Get.width,
        height: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25),
                offset: Offset(0, 4),
                blurRadius: 4)
          ],
          gradient: LinearGradient(
              begin: Alignment(0.8421556353569031, 0.160120889544487),
              end: Alignment(-0.160120889544487, 0.17399908602237701),
              colors: [
                Color.fromRGBO(55, 49, 0, 0.9800000190734863),
                Color.fromRGBO(32, 28, 0, 1),
              ]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Wrap(
                    direction: Axis.vertical,
                    children: [
                      Text(
                        'SONIC CARD',
                        textAlign: TextAlign.left,
                        style: AppTextStyles.kAtmCardBalanceText.copyWith(
                            fontSize: 10, color: AppColors.kAppTextColor),
                      ),
                      Text(
                        ' JHONS MIKE',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.kAtmCardTitle,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.contactless_outlined,
                  size: 24,
                  color: AppColors.kAppTextColor,
                ),
                Icon(
                  Icons.payment_outlined,
                  size: 24,
                  color: Color(0xff3700FF),
                ),
                Icon(
                  Icons.join_full,
                  size: 24,
                  color: Color(0xffFF0000),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'BALANCE',
                  textAlign: TextAlign.left,
                  style: AppTextStyles.kAtmCardBalanceText
                      .copyWith(color: Color(0xFFFFC700)),
                ),
                Text('₹ 99999.00',
                    textAlign: TextAlign.left,
                    style:
                        AppTextStyles.kAtmCardBalance.copyWith(fontSize: 32)),
                Text(
                  '10/25',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.kAtmCardTitle.copyWith(fontSize: 10),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Mem \n ID',
                  textAlign: TextAlign.right,
                  style: AppTextStyles.kAtmCardTitle.copyWith(fontSize: 10),
                ),
                Text('3X5X 0XX3 4XX4',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.kAtmCardTitle.copyWith(
                      fontSize: 32,
                      color: Color.fromRGBO(255, 255, 255, 0.1),
                    )),
                const SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.qr_code_2_outlined,
                  size: 24,
                  color: white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
