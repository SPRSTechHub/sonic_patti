import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sonicpattilive/utils/constants.dart';

import '../../controllers/home_controller.dart';

class EarnDashBoard extends StatefulWidget {
  const EarnDashBoard({super.key});

  @override
  State<EarnDashBoard> createState() => _EarnDashBoardState();
}

class _EarnDashBoardState extends State<EarnDashBoard> {
  final HomeController gameController = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: Get.width,
              height: 74,
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromRGBO(253, 232, 218, 1),
                            Color.fromRGBO(255, 209, 192, 1)
                          ]),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.white,
                            offset: Offset(4, 4),
                            blurRadius: 6)
                      ],
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.widgets_outlined,
                        color: Colors.black,
                        shadows: <Shadow>[
                          Shadow(
                              color: Colors.white,
                              blurRadius: 2.0,
                              offset: Offset.zero)
                        ],
                      ),
                      onPressed: () {
                        //
                      },
                    ),
                  ),
                  Container(
                    width: 42,
                    height: 42,
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            offset: Offset(4, 4),
                            blurRadius: 4)
                      ],
                      color: Color.fromRGBO(217, 217, 217, 1),
                      image: DecorationImage(
                          image: AssetImage('assets/icon/logo_sonic.png'),
                          fit: BoxFit.fitWidth),
                      borderRadius: BorderRadius.all(Radius.elliptical(75, 74)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 0,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: Get.width * .05),
                      width: Get.width * .9,
                      height: 150,
                      decoration: BoxDecoration(
                        color: const Color(0xff3F00FD),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(4, 4),
                              blurRadius: 6)
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Sonic',
                                textAlign: TextAlign.center,
                                style: AppTextStyles.kEarnTitleHeading,
                              ),
                              Text(
                                '10000 ',
                                textAlign: TextAlign.center,
                                style: AppTextStyles.kAtmCardTitle
                                    .copyWith(fontSize: 42),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.balance,
                                color: Colors.white,
                                shadows: <Shadow>[
                                  Shadow(
                                      color: Colors.white,
                                      blurRadius: 2.0,
                                      offset: Offset.zero)
                                ],
                              ),
                              Text(
                                '10.00',
                                textAlign: TextAlign.center,
                                style: AppTextStyles.kAtmCardTitle
                                    .copyWith(fontSize: 42),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      top: 100,
                      child: Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: Get.width * .1),
                          width: Get.width * .8,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(4, 4),
                                  blurRadius: 6)
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 62,
                                width: 62,
                                decoration: BoxDecoration(
                                  color: const Color(0xff3F00FD),
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.redAccent,
                                        offset: Offset(4, 4),
                                        blurRadius: 6)
                                  ],
                                ),
                                child: Text(
                                  '31',
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.kAtmCardTitle
                                      .copyWith(fontSize: 40),
                                ),
                              ),
                              Text(
                                'Daily Tasks',
                                textAlign: TextAlign.center,
                                style: AppTextStyles.kAtmCardTitle
                                    .copyWith(color: Colors.black45),
                              ),
                              const Icon(
                                Icons.done_all_outlined,
                                color: Colors.blueAccent,
                                shadows: <Shadow>[
                                  Shadow(
                                      color: Colors.white,
                                      blurRadius: 2.0,
                                      offset: Offset.zero)
                                ],
                              ),
                            ],
                          ))),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Quick Tasks',
                  textAlign: TextAlign.center,
                  style:
                      AppTextStyles.kAtmCardTitle.copyWith(color: Colors.black),
                ),
                const Icon(
                  Icons.double_arrow,
                  color: Colors.blueAccent,
                  shadows: <Shadow>[
                    Shadow(
                        color: Colors.white,
                        blurRadius: 2.0,
                        offset: Offset.zero)
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: const EdgeInsets.all(4.0),
                  width: 160,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: const Color.fromRGBO(238, 12, 12, 1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const ClipRRect(
                        child: Image(
                            width: 60,
                            height: 60,
                            image: AssetImage("assets/images/yt_icon.png")),
                      ),
                      Text(
                        'WATCH & EARN',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.kAtmCardTitle,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 160,
                  height: 150,
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: const Color(0xff26D000),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const ClipRRect(
                        child: Image(
                            width: 60,
                            height: 60,
                            image: AssetImage("assets/images/nw_icon.png")),
                      ),
                      Text(
                        'READ & EARN',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.kAtmCardTitle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'All Tasks',
                  textAlign: TextAlign.center,
                  style:
                      AppTextStyles.kAtmCardTitle.copyWith(color: Colors.black),
                ),
                const Icon(
                  Icons.double_arrow,
                  color: Colors.blueAccent,
                  shadows: <Shadow>[
                    Shadow(
                        color: Colors.white,
                        blurRadius: 2.0,
                        offset: Offset.zero)
                  ],
                ),
              ],
            ),
            SizedBox(
              /*  height: 800, */
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
                                  child: ListofSubTasks(
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
          ],
        ),
      ),
    );
  }
}

class ListofSubTasks extends StatefulWidget {
  ListofSubTasks(
      {super.key,
      required this.matchId,
      required this.matchTime,
      required this.gameTitle,
      this.matchIcon,
      required this.status,
      required this.live});

  String matchId;
  String matchTime;
  String gameTitle;
  String? matchIcon;
  String status;
  String live;

  @override
  State<ListofSubTasks> createState() => _ListofSubTasksState();
}

class _ListofSubTasksState extends State<ListofSubTasks> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Color.fromRGBO(248, 243, 242, 1),
      ),
      child: Row(
        children: [
          const ClipRRect(
            child: Image(
                width: 60,
                height: 60,
                image: AssetImage("assets/images/yt_icon.png")),
          ),
          Text(
            'INSTALL AND EARN',
            textAlign: TextAlign.center,
            style: AppTextStyles.kAtmCardTitle.copyWith(color: Colors.black),
          ),
          const Icon(
            Icons.double_arrow,
            color: Colors.blueAccent,
            shadows: <Shadow>[
              Shadow(color: Colors.white, blurRadius: 2.0, offset: Offset.zero)
            ],
          ),
        ],
      ),
    );
  }
}
