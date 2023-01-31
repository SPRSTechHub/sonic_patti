import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonic_patti/utils/constants.dart';

class BuildATMCard extends StatelessWidget {
  BuildATMCard({super.key});
  final uwbal = Constant.box.read('uwbal');
  final userid = Constant.box.read('userid') ?? 'XXX';
  final fullname = Constant.box.read('fullname') ?? 'XXXX';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      padding: const EdgeInsets.only(right: 4.0, bottom: 8.0),
      width: Get.width,
      height: 160,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        width: Get.width,
        height: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25),
                offset: Offset(0, 2),
                blurRadius: 4)
          ],
          image: const DecorationImage(
              image: AssetImage('assets/images/attm.png'), fit: BoxFit.cover),
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
                        ' ${fullname.toUpperCase()}',
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
                const Icon(
                  Icons.payment_outlined,
                  size: 24,
                  color: Color(0xff3700FF),
                ),
                const Icon(
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
                      .copyWith(color: const Color(0xFFFFC700)),
                ),
                Text('₹ ${int.parse(uwbal.toString()).toDouble()}',
                    textAlign: TextAlign.left,
                    style: AppTextStyles.kAtmCardBalance.copyWith(
                        fontSize: 32,
                        color: Theme.of(context).colorScheme.onPrimary)),
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
                      color: const Color.fromRGBO(255, 255, 255, 0.1),
                    )),
                const SizedBox(
                  width: 20,
                ),
                const Icon(
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
