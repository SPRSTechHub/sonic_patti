import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonic_patti/utils/constants.dart';
import 'package:sonic_patti/views/obscreen/screen_three.dart';
import 'package:swipe_to/swipe_to.dart';
import '../../controllers/animCtroller.dart';
import 'comps/slanding_clipper.dart';

class OnboardingScreenTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final AnimateController animateController = Get.put(AnimateController());
    return Scaffold(
      body: SwipeTo(
        onRightSwipe: () {
          Get.back();
        },
        onLeftSwipe: () {
          Get.to(
            OnboardingScreenThree(),
            transition: Transition.cupertino,
            duration: const Duration(milliseconds: 500),
          );
        },
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RotatedBox(
                  quarterTurns: 2,
                  child: ClipPath(
                    clipper: SlandingClipper(),
                    child: Container(
                      height: size.height * 0.4,
                      color: bgColor2,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.6,
                  child: Obx(
                    () => AnimatedOpacity(
                      opacity: animateController.visible.isTrue ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 1000),
                      child: Image(
                        width: size.width,
                        height: size.height * 0.6,
                        fit: BoxFit.cover,
                        image: const AssetImage('assets/images/onboard2.png'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: size.height * 0.05,
              child: Container(
                width: size.width,
                padding: const EdgeInsets.all(appPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      ht2,
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
                      'Lorem Ipsum is simply dummy \ntext of the printing and typesetting industry.',
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
                        color: white),
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
                      onPressed: () {
                        Get.to(
                          OnboardingScreenThree(),
                          transition: Transition.cupertino,
                          duration: const Duration(milliseconds: 500),
                        );
                      },
                      child: const Text(
                        'Skip',
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => OnboardingScreenThree(),
                          ),
                        );
                      },
                      backgroundColor: white,
                      child: const Icon(
                        Icons.navigate_next_rounded,
                        color: black,
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
