import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:sonic_patti/utils/constants.dart';
import 'package:sonic_patti/views/components/betplacement_a.dart';
import 'package:sonic_patti/views/components/betplacement_b.dart';
import '../../controllers/home_controller.dart';

String formatTime(int seconds) {
  return '${(Duration(seconds: seconds))}'.split('.')[0].padLeft(8, '0');
}

class ListofSubGames extends StatefulWidget {
  ListofSubGames(
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
  State<ListofSubGames> createState() => _ListofSubGamesState();
}

class _ListofSubGamesState extends State<ListofSubGames> {
  final HomeController gamesController = Get.find<HomeController>();
  Timer? timer;
  bool liveStat = false;

  late final mTime = widget.matchTime;
  late final currentTime = DateTime.now();
  late final startTime = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      int.parse(mTime.substring(0, 2)),
      int.parse(mTime.substring(mTime.length - 2)));
  late int seconds = startTime.difference(currentTime).inSeconds;

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (seconds > 0) {
        if (mounted) {
          setState(() {
            seconds--;
          });
        }
      } else {
        stopTimer();
      }
    });
  }

  void stopTimer() {
    timer?.cancel();
    Get.back();
  }

  @override
  void initState() {
    if (!mounted) return;
    if (widget.live == 'yes') {
      liveStat = true;
      startTimer();
    }

    super.initState();
  }

  @override
  void dispose() {
    if (!mounted) return;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        if (widget.live == 'no') {
          Get.snackbar('Alert', 'This Game is not Live now');
          showModalB(widget.matchId, context);
        } else {
          showModalB(widget.matchId, context);
        }
      }),
      child: SizedBox(
        height: 100,
        width: Get.width,
        child: Stack(
          fit: StackFit.passthrough,
          children: <Widget>[
            Positioned(
              child: Container(
                margin: const EdgeInsets.all(6.0),
                padding: const EdgeInsets.all(6.0),
                width: Get.width,
                height: 77,
                decoration: AppStyles.subGameListBg,
              ),
            ),
            Positioned(
              child: Center(
                child: Text(
                  widget.gameTitle,
                  textAlign: TextAlign.left,
                  style: AppTextStyles.kSubGameTitle,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.only(left: 12),
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromRGBO(223, 203, 26, 1),
                        offset: Offset(2, 2),
                        blurRadius: 0)
                  ],
                  color: const Color.fromRGBO(217, 217, 217, 1),
                  border: Border.all(
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    width: 1,
                  ),
                  image: DecorationImage(
                      image: NetworkImage("${widget.matchIcon}"),
                      fit: BoxFit.cover),
                  borderRadius:
                      const BorderRadius.all(Radius.elliptical(60, 60)),
                ),
              ),
            ),
            Positioned(
              top: 12,
              left: 300,
              child: Container(
                width: 82,
                height: 25,
                decoration: AppStyles.timerBG,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: const EdgeInsets.only(right: 12.0, bottom: 12.0),
                width: 82,
                height: 25,
                decoration: AppStyles.subGameBetStatusBG,
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: const EdgeInsets.all(2.0),
                margin: const EdgeInsets.only(right: 22.0, top: 16.0),
                child: Text(
                  widget.live == 'yes' ? formatTime(seconds) : 'Closed',
                  textAlign: TextAlign.left,
                  style: AppTextStyles.kGameTime,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                  padding: const EdgeInsets.all(2.0),
                  margin: const EdgeInsets.only(right: 18.0, bottom: 16.0),
                  child: Text(
                    widget.live == 'yes' ? 'PLACE BET' : 'BET CLOSE',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'Inter',
                        fontSize: 12,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  )),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                  margin: const EdgeInsets.only(top: 4),
                  width: 120,
                  height: 24,
                  decoration: AppStyles.subGametopTimeBG),
            ),
            Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    widget.matchTime,
                    textAlign: TextAlign.left,
                    style: AppTextStyles.kGameTime,
                  ),
                )),
          ],
        ),
      ),
    );
  }

  showModalB(param, BuildContext context) {
    return showModalBottomSheet<void>(
        backgroundColor: Theme.of(context).colorScheme.background,
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        builder: (BuildContext context) {
          return SizedBox(
            height: Get.height * .7,
            width: Get.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.0),
                    ),
                    color: bottomBarHeader,
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 2,
                          child: Text('Select Bet Type',
                              style: AppTextStyles.kEarnTitleHeading)),
                      IconButton(
                        onPressed: (() => Get.back()),
                        icon: const Icon(
                          Icons.question_mark_outlined,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: (() => Get.back()),
                        icon: const Icon(
                          Icons.close_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.back();
                                Get.to(SingleDigitBet(matchId: param),
                                    transition: Transition.downToUp);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 6.0),
                                width: 186,
                                height: 72,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Theme.of(context).colorScheme.surface,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                        offset: const Offset(.5, .5),
                                        blurRadius: 1)
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    const Image(
                                      width: 48,
                                      height: 48,
                                      image:
                                          AssetImage('assets/images/digit.png'),
                                    ),
                                    Text(
                                      'SINGLE DIGIT',
                                      textAlign: TextAlign.center,
                                      style: AppTextStyles.kBetTextHeading,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () =>
                                  Get.snackbar('Alert', 'Working on it....'),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 6.0),
                                width: 186,
                                height: 72,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Theme.of(context).colorScheme.surface,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                        offset: const Offset(.5, .5),
                                        blurRadius: 1)
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    const Image(
                                      width: 60,
                                      height: 48,
                                      image: AssetImage(
                                          'assets/images/jodi_digit.png'),
                                    ),
                                    Text(
                                      'JODI DIGIT',
                                      textAlign: TextAlign.center,
                                      style: AppTextStyles.kBetTextHeading,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        height: 250,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.count(
                            crossAxisSpacing: 4,
                            mainAxisSpacing: 4,
                            crossAxisCount: 3,
                            childAspectRatio: (1 / .9),
                            shrinkWrap: true,
                            children: [
                              GestureDetector(
                                onTap: (() {
                                  Get.back();
                                  Get.to(PannaBet(matchId: param),
                                      transition: Transition.downToUp);
                                }),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 6.0),
                                  height: 100,
                                  width: Get.width / 3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color:
                                        Theme.of(context).colorScheme.surface,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurface,
                                          offset: const Offset(.5, .5),
                                          blurRadius: 1)
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      const Image(
                                        width: 42,
                                        height: 60,
                                        image: AssetImage(
                                            'assets/images/single.png'),
                                      ),
                                      Text(
                                        'SINGLE \n PANNA',
                                        textAlign: TextAlign.center,
                                        style: AppTextStyles.kBetTextHeading,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: (() {
                                  Get.back();
                                  Get.to(PannaBet(matchId: param),
                                      transition: Transition.downToUp);
                                }),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 6.0),
                                  height: 100,
                                  width: Get.width / 3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color:
                                        Theme.of(context).colorScheme.surface,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurface,
                                          offset: const Offset(.5, .5),
                                          blurRadius: 1)
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      const Image(
                                        width: 42,
                                        height: 60,
                                        image: AssetImage(
                                            'assets/images/double.png'),
                                      ),
                                      Text(
                                        'DOUBLE \n PANNA',
                                        textAlign: TextAlign.center,
                                        style: AppTextStyles.kBetTextHeading,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: (() {
                                  Get.back();
                                  Get.to(PannaBet(matchId: param),
                                      transition: Transition.downToUp);
                                }),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 6.0),
                                  height: 100,
                                  width: Get.width / 3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color:
                                        Theme.of(context).colorScheme.surface,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurface,
                                          offset: const Offset(.5, .5),
                                          blurRadius: 1)
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      const Image(
                                        width: 42,
                                        height: 60,
                                        image: AssetImage(
                                            'assets/images/tripple.png'),
                                      ),
                                      Text(
                                        'TRIPPLE \n PANNA',
                                        textAlign: TextAlign.center,
                                        style: AppTextStyles.kBetTextHeading,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 6.0),
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Theme.of(context).colorScheme.surface,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                        offset: const Offset(.5, .5),
                                        blurRadius: 1)
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    const Image(
                                      width: 42,
                                      height: 60,
                                      image: AssetImage(
                                          'assets/images/single.png'),
                                    ),
                                    Text(
                                      'HALF \n MILAN',
                                      textAlign: TextAlign.center,
                                      style: AppTextStyles.kBetTextHeading,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 6.0),
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Theme.of(context).colorScheme.surface,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                        offset: const Offset(.5, .5),
                                        blurRadius: 1)
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    const Image(
                                      width: 42,
                                      height: 60,
                                      image: AssetImage(
                                          'assets/images/double.png'),
                                    ),
                                    Text(
                                      'FULL \n MILAN',
                                      textAlign: TextAlign.center,
                                      style: AppTextStyles.kBetTextHeading,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 6.0),
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Theme.of(context).colorScheme.surface,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                        offset: const Offset(.5, .5),
                                        blurRadius: 1)
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    const Image(
                                      width: 42,
                                      height: 60,
                                      image: AssetImage(
                                          'assets/images/tripple.png'),
                                    ),
                                    Text(
                                      'CP \n BID',
                                      textAlign: TextAlign.center,
                                      style: AppTextStyles.kBetTextHeading,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Text('MORE BIDS ADDED HERE ....'),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
