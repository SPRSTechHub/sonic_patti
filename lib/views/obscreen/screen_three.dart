import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sonic_patti/views/gameScreens/gameboard.dart';
import 'package:sonic_patti/views/splashscreen.dart';
import 'package:swipe_to/swipe_to.dart';
import 'dart:math' as math;

import '../../controllers/animCtroller.dart';
import '../../utils/constants.dart';
import 'comps/slanding_clipper.dart';

class OnboardingScreenThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final AnimateController animateController = Get.put(AnimateController());
    return Scaffold(
      body: SwipeTo(
        onRightSwipe: () {
          Get.back();
        },
        /* onLeftSwipe: () {
          Get.to(
            OnboardingScreenThree(),
            transition: Transition.cupertino,
            duration: const Duration(milliseconds: 500),
          );
        }, */
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => AnimatedOpacity(
                    opacity: animateController.visible.isTrue ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 1000),
                    child: Image(
                      width: size.width,
                      height: size.height * 0.6,
                      fit: BoxFit.cover,
                      image: const AssetImage('assets/images/onboard3.png'),
                    ),
                  ),
                ),
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(math.pi),
                  child: ClipPath(
                    clipper: SlandingClipper(),
                    child: Container(
                      height: size.height * 0.4,
                      color: bgColor2,
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              top: size.height * 0.65,
              child: Container(
                width: size.width,
                padding: const EdgeInsets.all(appPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      ht3,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: white,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    const Text(
                      ob3,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 15,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: appPadding / 4),
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                        border: Border.all(color: black, width: 2),
                        shape: BoxShape.circle,
                        color: bgColor2),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: appPadding / 4),
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                        border: Border.all(color: black, width: 2),
                        shape: BoxShape.circle,
                        color: bgColor2),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: appPadding / 4),
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                        border: Border.all(color: black, width: 2),
                        shape: BoxShape.circle,
                        color: white),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: appPadding * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => print('Skip'),
                      child: const Text(
                        'Finish',
                        style: TextStyle(
                          color: Color(0xFFE7C424),
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: appPadding),
                    child: FloatingActionButton(
                      onPressed: () async {
                        GetStorage box = GetStorage();
                        box.write('initFirst', true);
                        Get.to(
                          const GameBoard(
/*                             title: 'Test App',
 */
                              ),
                          transition: Transition.circularReveal,
                          duration: const Duration(milliseconds: 1000),
                        );
                      },
                      backgroundColor: const Color(0xFF93000A),
                      child: const Icon(
                        Icons.done_rounded,
                        color: bgColor2,
                        size: 30,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
