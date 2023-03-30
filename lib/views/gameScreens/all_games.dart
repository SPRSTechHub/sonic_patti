import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sonicpattilive/views/components/catagories_panel.dart';
import 'package:sonicpattilive/views/earnscreen/earnland.dart';
import 'package:text_scroll/text_scroll.dart';

import '../../controllers/home_controller.dart';
import '../../utils/constants.dart';

class AllGames extends StatefulWidget {
  const AllGames({super.key});

  @override
  State<AllGames> createState() => _AllGamesState();
}

class _AllGamesState extends State<AllGames> {
  final HomeController _mainController = Get.find<HomeController>();

  static const List<Widget> fruits = <Widget>[Text('Play'), Text('Earn')];
  final List<bool> _selectedFruits = <bool>[false, true];
  @override
  void initState() {
    print(Constant.box.read('setGame'));
    _mainController.fetchOffers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _mainController.scrollController,
      child: SizedBox(
        child: Stack(
          fit: StackFit.loose,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 240,
                  width: Get.width,
                  child: Obx(() {
                    if (_mainController.isOfferProcessing.value == true) {
                      return GestureDetector(
                        child: Center(child: CircularProgressIndicator()),
                      );
                    } else {
                      if (_mainController.offerLists.isNotEmpty) {
                        return Column(
                          children: [
                            Container(
                              height: 180,
                              width: Get.width,
                              child: CarouselSlider.builder(
                                itemCount: _mainController.offerLists.length,
                                itemBuilder: (BuildContext context, itemIndex,
                                        int pageViewIndex) =>
                                    Container(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(18),
                                    child: FadeInImage(
                                      width: Get.width,
                                      filterQuality: FilterQuality.low,
                                      fit: BoxFit.fill,
                                      image: NetworkImage(_mainController
                                          .offerLists[itemIndex].offerLink),
                                      placeholder: AssetImage(
                                          'assets/images/offer1.png'),
                                    ),
                                  ),
                                ),
                                options: CarouselOptions(
                                  aspectRatio: 16 / 9,
                                  enlargeCenterPage: true,
                                  enableInfiniteScroll: false,
                                  initialPage: 1,
                                  autoPlay: true,
                                  autoPlayInterval: Duration(seconds: 5),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 32,
                              color: Colors.red,
                              child: TextScroll(
                                _mainController.notices,
                                style: AppTextStyles.kSubGameTitle
                                    .copyWith(fontSize: 12, height: 2.5),
                                mode: TextScrollMode.bouncing,
                                velocity: const Velocity(
                                    pixelsPerSecond: Offset(30, 0)),
                                delayBefore: const Duration(milliseconds: 500),
                                selectable: true,
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text('Offers are loading ....'),
                          ],
                        );
                      }
                    }
                  }),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 700,
                  child: Center(
                    child: Obx(() {
                      if (_mainController.isDataProcessing.value == true) {
                        return GestureDetector(
                          onTap: () => _mainController.fetchCatagories(),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      } else {
                        if (_mainController.catLists.isNotEmpty) {
                          return const ListofGames();
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
                    }),
                  ),
                ),
              ],
            ),
            Center(
              child: Container(
                height: 42,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.30),
                        offset: Offset(4, 6),
                        blurRadius: 8)
                  ],
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(221, 200, 0, 1),
                      Color.fromRGBO(255, 0, 0, 1)
                    ],
                  ),
                ),
                child: ToggleButtons(
                  direction: Axis.horizontal,
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  selectedBorderColor: Theme.of(context).colorScheme.primary,
                  selectedColor: Colors.white,
                  fillColor: bgColor1,
                  constraints:
                      const BoxConstraints(minHeight: 41.5, minWidth: 73.5),
                  isSelected: _selectedFruits,
                  children: fruits,
                  onPressed: (int index) {
                    setState(() {
                      if (index != 0) {
                        Get.to(const EarningBoard(),
                            transition: Transition.fade);
                      }
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
