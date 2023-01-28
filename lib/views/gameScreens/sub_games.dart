import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:sonic_patti/controllers/home_controller.dart';
import 'package:sonic_patti/utils/constants.dart';
import 'package:sonic_patti/views/components/subgame_panel.dart';

import '../components/appbar.dart';

class SubGames extends StatefulWidget {
  const SubGames({super.key, required this.catId});
  final String? catId;
  @override
  State<SubGames> createState() => _SubGamesState();
}

class _SubGamesState extends State<SubGames> {
  final HomeController gameController = Get.find<HomeController>();
  int currentPageIndex = 0;

  @override
  void initState() {
    if (!mounted) return;

    if (widget.catId != '') {
      setState(() {
        gameController.fetchGameLists(widget.catId!);
        gameController.fetchMarket(widget.catId!);
      });
    } else {
      Get.back();
    }
    // setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56.0),
        child: TopAppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).colorScheme.secondary,
              ),
              child: Obx(() {
                if (gameController.isDataProcessing.value == true) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (gameController.mktList.isNotEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'MARKET RATE CHART',
                            style: AppTextStyles.kBetTextHeading
                                .copyWith(color: Colors.black),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('SINGLE DIGIT',
                                  textAlign: TextAlign.left,
                                  style: AppTextStyles.kMktRtio),
                              Text(gameController.mktList[0].sd ?? '0.00'),
                            ],
                          ),
                          const Divider(
                            height: 1,
                            indent: 10,
                            endIndent: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'SINGLE PANNA',
                                textAlign: TextAlign.left,
                                style: AppTextStyles.kMktRtio,
                              ),
                              Text(gameController.mktList[0].sp ?? '0.00'),
                            ],
                          ),
                          const Divider(
                            height: 1,
                            indent: 10,
                            endIndent: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'DOUBLE PANNA',
                                style: AppTextStyles.kMktRtio,
                              ),
                              Text(gameController.mktList[0].dp ?? '0.00'),
                            ],
                          ),
                          const Divider(
                            height: 1,
                            indent: 10,
                            endIndent: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'TRIPPLE PANNA',
                                style: AppTextStyles.kMktRtio,
                              ),
                              Text(gameController.mktList[0].tp ?? '0.00'),
                            ],
                          ),
                          const Divider(
                            height: 1,
                            indent: 10,
                            endIndent: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'CP MATCHED',
                                style: AppTextStyles.kMktRtio,
                              ),
                              Text(gameController.mktList[0].cp ?? '0.00'),
                            ],
                          ),
                          const Divider(
                            height: 1,
                            indent: 10,
                            endIndent: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'JODI MATCHED',
                                style: AppTextStyles.kMktRtio,
                              ),
                              Text(gameController.mktList[0].jodi ?? '0.00'),
                            ],
                          ),
                        ],
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }
              }),
            ),
            SizedBox(
              child: Obx(() {
                if (gameController.isDataProcessing.value == true) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (gameController.gameLists.isNotEmpty) {
                    return AnimationLimiter(
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: ((context, index) {
                            var gameData = gameController.gameLists[index];
                            return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 575),
                              delay: const Duration(milliseconds: 175),
                              child: SlideAnimation(
                                verticalOffset: 50.0,
                                child: FadeInAnimation(
                                  child: ListofSubGames(
                                      matchId: gameData.matchId,
                                      matchTime: gameData.matchTime,
                                      gameTitle: gameData.gameTitle,
                                      matchIcon: gameData.matchIcon,
                                      status: gameData.status,
                                      live: gameData.live),
                                ),
                              ),
                            );
                          }),
                          itemCount: gameController.gameLists.length),
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
              }),
            ),
            Container(
              color: Colors.amber,
              height: 100,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          Get.back();
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
