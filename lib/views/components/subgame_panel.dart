import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonic_patti/utils/constants.dart';
import 'package:timer_builder/timer_builder.dart';

import '../../controllers/home_controller.dart';

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
  Timer? countdownTimer;
  //Duration myDuration = Duration(days: 1);
  //const mt = widget.matchTime;

  Duration myDuration = const Duration(days: 1);
  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  // Step 4
  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  // Step 6
  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  void initState() {
    if (!mounted) return;
    if (widget.live == 'yes') {
      startTimer();
    }
    //print(myDuration);
    //var td = DateFormat.Hms([widget.matchTime]);
    // print(td);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final days = strDigits(myDuration.inDays);
    // Step 7
    final hours = strDigits(myDuration.inHours.remainder(24));
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));

    return GestureDetector(
      onTap: (() {
        if (widget.live == 'no') {
          Get.snackbar('Alert', 'This Game is not Live now');
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        offset: Offset(0, 4),
                        blurRadius: 4)
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: AppColors.kListCardGradient,
                  ),
                ),
              ),
            ),
            Positioned(
                child: Center(
              child: Text(
                widget.gameTitle,
                textAlign: TextAlign.left,
                style: const TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 16,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1),
              ),
            )),
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
                    ))),
            Positioned(
              top: 12,
              left: 300,
              child: Container(
                width: 82,
                height: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(252, 0, 197, 0.56),
                        Color.fromRGBO(0, 35, 40, 1)
                      ]),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: const EdgeInsets.only(right: 12.0, bottom: 12.0),
                width: 82,
                height: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(0, 255, 176, 1),
                        Color.fromRGBO(249, 255, 0, 0.5)
                      ]),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: const EdgeInsets.all(2.0),
                margin: const EdgeInsets.only(right: 22.0, top: 16.0),
                child: Text(
                  '$hours:$minutes:$seconds',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      color: Colors.red,
                      fontFamily: 'Inter',
                      fontSize: 12,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                  padding: const EdgeInsets.all(2.0),
                  margin: const EdgeInsets.only(right: 18.0, bottom: 16.0),
                  child: const Text(
                    'PLACE BET',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'Inter',
                        fontSize: 12,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  )),
            ),
            Align(
                alignment: Alignment.topCenter,
                child: Container(
                    width: 120,
                    height: 24,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                        bottomLeft: Radius.circular(14),
                        bottomRight: Radius.circular(14),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            offset: Offset(0, 2),
                            blurRadius: 1)
                      ],
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromRGBO(36, 74, 58, 0),
                            Color.fromRGBO(7, 28, 22, 1)
                          ]),
                    ))),
            Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    widget.matchTime,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        color: Color.fromRGBO(255, 0, 0, 1),
                        fontFamily: 'Inter',
                        fontSize: 12,
                        letterSpacing: 0,
                        fontWeight: FontWeight.bold,
                        height: 1),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}


/*
 "id": "17",
      "match_id": "FFLV17",
      "match_time": "09:55",
      "day": "thursday",
      "game_title": "NM BAZAR BAZI - 1",
      "game_id": "FFGCID17",
      "cat_title": "NEW MUMBAI BAZAR",
      "cat_id": "FFGC3",
      "match_icon": "https://control.fatafatguru.in/uploads/sub.jpg",
      "status": "0",
      "live": "no"
      */