import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:sonic_patti/utils/constants.dart';

import '../../controllers/home_controller.dart';
import '../gameScreens/sub_games.dart';

class ListofGames extends StatefulWidget {
  const ListofGames({super.key});

  @override
  State<ListofGames> createState() => _ListofGamesState();
}

class _ListofGamesState extends State<ListofGames> {
  final HomeController listController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: MasonryGridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: ((context, index) {
            var catData = listController.catLists[index];
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 375),
              delay: const Duration(milliseconds: 175),
              child: ScaleAnimation(
                child: FadeInAnimation(
                  child: GestureDetector(
                    onTap: (() {
                      Get.to(SubGames(catId: catData.catId),
                          transition: Transition.zoom);
                    }),
                    child: Container(
                      height: 220,
                      margin: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).colorScheme.surface,
                          width: 6,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://control.fatafatguru.in/uploads/cat_img/${catData.catIurl}"),
                            fit: BoxFit.cover),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Flexible(
                            flex: 2,
                            fit: FlexFit.loose,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 8.0),
                                  padding: const EdgeInsets.all(4.0),
                                  width: 42,
                                  height: 18,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(0),
                                      bottomLeft: Radius.circular(12),
                                      bottomRight: Radius.circular(0),
                                    ),
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomRight,
                                        end: Alignment.topCenter,
                                        colors: [
                                          Color.fromRGBO(255, 4, 4, 1),
                                          Color.fromRGBO(255, 4, 4, 0.7),
                                        ]),
                                  ),
                                  child: const Text(
                                    'LIVE',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontFamily: 'Inter',
                                        fontSize: 10,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Flexible(
                            fit: FlexFit.tight,
                            flex: 1,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(4),
                                  bottomRight: Radius.circular(4),
                                ),
                                color: Theme.of(context)
                                    .colorScheme
                                    .onInverseSurface,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    catData.catTitle,
                                    textAlign: TextAlign.left,
                                    style: AppTextStyles.kSubGameTitle.copyWith(
                                        fontSize: 14,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onTertiaryContainer),
                                  ),
                                  Text(
                                    "imageHero$index",
                                    textAlign: TextAlign.left,
                                    style: AppTextStyles.kGameheading2,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
          itemCount: listController.catLists.length),
    );
  }
}
