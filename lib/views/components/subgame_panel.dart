import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonic_patti/utils/constants.dart';

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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      padding: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: AppColors.kListCardGradient,
        ),
        boxShadow: const [
          BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.75), offset: Offset(4, 4))
        ],
      ),
      height: 80,
      child: Text(widget.gameTitle),
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