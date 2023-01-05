import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';

class ListofSubGames extends StatefulWidget {
  const ListofSubGames({super.key});

  @override
  State<ListofSubGames> createState() => _ListofSubGamesState();
}

class _ListofSubGamesState extends State<ListofSubGames> {
  final HomeController gamesController = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
          itemBuilder: ((context, index) {
            var gameData = gamesController.gameLists[index];
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 575),
              delay: const Duration(milliseconds: 175),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: GestureDetector(
                    onTap: (() {
                      //print(catData.catId);
                    }),
                    child: Container(
                      height: 80,
                      margin: const EdgeInsets.all(6),
                      child: Text(gameData.gameTitle),
                    ),
                  ),
                ),
              ),
            );
          }),
          itemCount: gamesController.gameLists.length),
    );
  }
}
