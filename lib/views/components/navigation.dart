// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';
import '../../utils/constants.dart';

class navBar extends StatefulWidget {
  const navBar({
    super.key,
    required this.isElevated,
    required this.isVisible,
    required int index,
  });

  final bool isElevated;
  final bool isVisible;

  @override
  State<navBar> createState() => _navBarState();
}

class _navBarState extends State<navBar> {
  List<IconData> listOfIcons = [
    Icons.widgets_outlined,
    Icons.person_outline,
    Icons.gavel,
    Icons.military_tech_outlined,
    Icons.group_add_outlined,
  ];
  List<String> listOfTexts = ['Home', 'Profile', 'My Bid', 'Results', 'Refer'];

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    return Obx(
      () => AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        height: controller.isVisible.isFalse ? 0 : 72.0,
        child: BottomAppBar(
          color: Theme.of(context).colorScheme.surface,
          elevation: widget.isElevated ? null : 0.0,
          child: Row(
            children: [
              SizedBox(
                width: Get.width * .8,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      setState(
                        () {
                          controller.tabIndex.value = index;
                        },
                      );
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Wrap(
                      children: [
                        Column(
                          children: <Widget>[
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 1000),
                              curve: Curves.fastLinearToSlowEaseIn,
                              margin: EdgeInsets.only(
                                bottom: index == controller.tabIndex.value
                                    ? 0
                                    : Get.width * .042,
                                right: Get.width * .0120,
                                left: Get.width * .0120,
                              ),
                              width: (Get.width * .8) * .162,
                              height: index == controller.tabIndex.value
                                  ? Get.width * .016
                                  : 0,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.secondary,
                                borderRadius: const BorderRadius.vertical(
                                  bottom: Radius.circular(10),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: 6,
                                right: Get.width * .0120,
                                left: Get.width * .0120,
                              ),
                              width: (Get.width * .8) * .162,
                              child: Column(
                                children: [
                                  Icon(
                                    listOfIcons[index],
                                    size: Get.width * .068,
                                    shadows: const <Shadow>[
                                      Shadow(
                                          color: Colors.black,
                                          blurRadius: 2.0,
                                          offset: Offset.zero)
                                    ],
                                    color: index == controller.tabIndex.value
                                        ? Theme.of(context)
                                            .colorScheme
                                            .secondary
                                        : Theme.of(context)
                                            .colorScheme
                                            .onSurface
                                            .withOpacity(0.4),
                                  ),
                                  Text(
                                    listOfTexts[index],
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight:
                                          index == controller.tabIndex.value
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                      color: index == controller.tabIndex.value
                                          ? Theme.of(context)
                                              .colorScheme
                                              .secondary
                                          : Theme.of(context)
                                              .colorScheme
                                              .onSurface
                                              .withOpacity(0.4),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: Get.width * .01),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: Get.width * .2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
