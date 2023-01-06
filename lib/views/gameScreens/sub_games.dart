import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
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
    if (widget.catId != '') {
      setState(() {
        gameController.fetchGameLists(widget.catId!);
      });
    } else {
      Get.back();
    }
    setState(() {});
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
              color: Colors.amber,
              height: 120,
            ),
            SizedBox(
              height: 800,
              child: Obx(() {
                if (gameController.isDataProcessing.value == true) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (gameController.catLists.isNotEmpty) {
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
                                      matchId: gameData.gameId,
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
