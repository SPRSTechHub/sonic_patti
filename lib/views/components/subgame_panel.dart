import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonic_patti/utils/constants.dart';
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

  late final mTime = widget.matchTime ?? '00:00';
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
        setState(() {
          seconds--;
        });
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        if (widget.live == 'no') {
          Get.snackbar('Alert', 'This Game is not Live now');
        } else {
          showModalB(widget.matchId);
        }
        print(widget.matchId);
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
                  width: 120,
                  height: 24,
                  decoration: AppStyles.subGametopTimeBG),
            ),
            Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: const EdgeInsets.only(top: 8.0),
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

  showModalB(param) {
    return showModalBottomSheet(
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
                    color: bgColor1,
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Select Bet Type'),
                      IconButton(
                          onPressed: (() => Get.back()),
                          icon: const Icon(
                            Icons.close_outlined,
                            color: Colors.white,
                          ))
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    width: Get.width,
                    color: AppColors().kPrimaryBoxBackground,
                    child: Text(param.toString()),
                  ),
                )
              ],
            ),
          );
        });
  }
}
