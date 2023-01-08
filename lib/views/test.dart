// ignore_for_file: non_constant_identifier_names
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonic_patti/main.dart';
import 'package:sonic_patti/utils/constants.dart';

String formatTime(int seconds) {
  return '${(Duration(seconds: seconds))}'.split('.')[0].padLeft(8, '0');
}

class Testt extends StatefulWidget {
  const Testt({super.key});

  @override
  State<Testt> createState() => _TesttState();
}

class _TesttState extends State<Testt> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        onPressed: (() => showModalB('param')),
        child: const Text('open'),
      )),
    );
  }

  showModalB(param) {
    return showModalBottomSheet(
        backgroundColor: bottomBarBg,
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
                      const Expanded(flex: 2, child: Text('Select Bet Type')),
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
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              width: 186,
                              height: 72,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color.fromRGBO(142, 111, 0, 1),
                                      Color.fromRGBO(249, 255, 0, 1),
                                      Color.fromRGBO(142, 111, 0, 1)
                                    ]),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const <Widget>[
                                  Image(
                                    width: 48,
                                    height: 48,
                                    image:
                                        AssetImage('assets/images/digit.png'),
                                  ),
                                  Text(
                                    'SINGLE DIGIT',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontFamily: 'Inter',
                                        letterSpacing: 0,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              width: 186,
                              height: 72,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color.fromRGBO(142, 111, 0, 1),
                                      Color.fromRGBO(249, 255, 0, 1),
                                      Color.fromRGBO(142, 111, 0, 1)
                                    ]),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const <Widget>[
                                  Image(
                                    width: 60,
                                    height: 48,
                                    image: AssetImage(
                                        'assets/images/jodi_digit.png'),
                                  ),
                                  Text(
                                    'JODI DIGIT',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontFamily: 'Inter',
                                        letterSpacing: 0,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              height: 72,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color.fromRGBO(142, 111, 0, 1),
                                      Color.fromRGBO(249, 255, 0, 1),
                                      Color.fromRGBO(142, 111, 0, 1)
                                    ]),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const <Widget>[
                                  Image(
                                    width: 48,
                                    height: 48,
                                    image:
                                        AssetImage('assets/images/single.png'),
                                  ),
                                  Text(
                                    'SINGLE \n PANNA',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontFamily: 'Inter',
                                        letterSpacing: 0,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              height: 72,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color.fromRGBO(142, 111, 0, 1),
                                      Color.fromRGBO(249, 255, 0, 1),
                                      Color.fromRGBO(142, 111, 0, 1)
                                    ]),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const <Widget>[
                                  Image(
                                    width: 48,
                                    height: 48,
                                    image:
                                        AssetImage('assets/images/double.png'),
                                  ),
                                  Text(
                                    'DOUBLE \n PANNA',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontFamily: 'Inter',
                                        letterSpacing: 0,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              height: 72,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color.fromRGBO(142, 111, 0, 1),
                                      Color.fromRGBO(249, 255, 0, 1),
                                      Color.fromRGBO(142, 111, 0, 1)
                                    ]),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const <Widget>[
                                  Image(
                                    width: 48,
                                    height: 48,
                                    image:
                                        AssetImage('assets/images/tripple.png'),
                                  ),
                                  Text(
                                    'TRIPPLE \n PANNA',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontFamily: 'Inter',
                                        letterSpacing: 0,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              height: 72,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color.fromRGBO(142, 111, 0, 1),
                                      Color.fromRGBO(249, 255, 0, 1),
                                      Color.fromRGBO(142, 111, 0, 1)
                                    ]),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const <Widget>[
                                  Image(
                                    width: 48,
                                    height: 48,
                                    image:
                                        AssetImage('assets/images/single.png'),
                                  ),
                                  Text(
                                    'HALF \n MILAN',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontFamily: 'Inter',
                                        letterSpacing: 0,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              height: 72,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color.fromRGBO(142, 111, 0, 1),
                                      Color.fromRGBO(249, 255, 0, 1),
                                      Color.fromRGBO(142, 111, 0, 1)
                                    ]),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const <Widget>[
                                  Image(
                                    width: 48,
                                    height: 48,
                                    image:
                                        AssetImage('assets/images/double.png'),
                                  ),
                                  Text(
                                    'FULL \n MILAN',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontFamily: 'Inter',
                                        letterSpacing: 0,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              height: 72,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color.fromRGBO(142, 111, 0, 1),
                                      Color.fromRGBO(249, 255, 0, 1),
                                      Color.fromRGBO(142, 111, 0, 1)
                                    ]),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const <Widget>[
                                  Image(
                                    width: 48,
                                    height: 48,
                                    image:
                                        AssetImage('assets/images/tripple.png'),
                                  ),
                                  Text(
                                    'CP \n BID',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontFamily: 'Inter',
                                        letterSpacing: 0,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
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
