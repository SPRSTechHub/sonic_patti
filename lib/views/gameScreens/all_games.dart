import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';
import '../../utils/constants.dart';

class AllGames extends StatefulWidget {
  const AllGames({super.key});

  @override
  State<AllGames> createState() => _AllGamesState();
}

class _AllGamesState extends State<AllGames> {
  final HomeController _mainController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: appBody,
      child: SingleChildScrollView(
        controller: _mainController.scrollController,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 1500,
              color: appBody,
              child: Text('home'),
            ),
            Container(
              height: 500,
              color: Colors.black12,
            ),
            Container(
              height: 500,
              color: Colors.blueGrey,
            ),
          ],
        ),
      ),
    );
  }
}
