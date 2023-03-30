import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sonicpattilive/controllers/controller_binding.dart';
import 'package:sonicpattilive/utils/constants.dart';
import 'package:sonicpattilive/views/earnscreen/earnland.dart';
import 'package:sonicpattilive/views/gameScreens/gameboard.dart';
import 'package:sonicpattilive/views/users/login.dart';

import '../controllers/cmc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  final ConnectionManagerController _controller =
      Get.find<ConnectionManagerController>();

  late AnimationController _fadeanimcontroller;
  late Animation<double> _animationfade;

  @override
  void initState() {
    super.initState();
    if (!mounted) {
      return;
    }
    setState(() {
      _fadeanimcontroller = AnimationController(
        duration: const Duration(seconds: 3),
        vsync: this,
      );
      _animationfade = Tween(
        begin: 0.0,
        end: 1.0,
      ).animate(_fadeanimcontroller.view);
      _fadeanimcontroller.forward();

      _fadeanimcontroller = AnimationController(
        duration: const Duration(seconds: 3),
        vsync: this,
      );
    });
    switch (setGame) {
      case 0:
        {
          Timer(const Duration(seconds: 5), () {
            setState(() {
              Get.to(EarnDashBoard(),
                  binding: ControllerBinding(),
                  transition: Transition.circularReveal);
            });
          });
        }
        break;

      case 1:
        {
          Timer(const Duration(seconds: 5), () {
            setState(() {
              Get.to(GameBoard(),
                  binding: ControllerBinding(),
                  transition: Transition.circularReveal);
            });
          });
        }
        break;

      case 2:
        {
          Timer(const Duration(seconds: 5), () {
            setState(() {
              Get.to(GameBoard(),
                  binding: ControllerBinding(),
                  transition: Transition.circularReveal);
            });
          });
        }
        break;

      default:
        {
          print(setGame);
          Timer(const Duration(seconds: 5), () {
            setState(() {
              Get.to(SetGameScreen(),
                  binding: ControllerBinding(),
                  transition: Transition.circularReveal);
            });
          });
        }
        break;
    }
  }

  @override
  void dispose() {
    _fadeanimcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: FadeTransition(
            opacity: _animationfade,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: const Image(
                    width: 90,
                    height: 90,
                    image: AssetImage("assets/icon/logo_sonic.png")),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SetGameScreen extends StatefulWidget {
  const SetGameScreen({super.key});

  @override
  State<SetGameScreen> createState() => _SetGameScreenState();
}

class _SetGameScreenState extends State<SetGameScreen> {
  final Reference storageRef = FirebaseStorage.instance.ref();
  var _images;
  int _randomNumber = 0;
  Random random = Random();

  void _generateRandom() {
    setState(() {
      _randomNumber = random.nextInt(9);
    });
  }

  @override
  void initState() {
    super.initState();
    _generateRandom();
    _pickFile(_randomNumber);
    print(_randomNumber);
  }

  void _pickFile(_randomNumber) async {
    final ref = storageRef.child("wlpbg").child("$_randomNumber.jpg");
    try {
      String fileUrl = await ref.getDownloadURL();
      setState(() {
        _images = fileUrl.toString();
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: Get.width,
          height: Get.height,
          alignment: Alignment.center,
          child: Stack(
            children: [
              SizedBox(
                height: Get.height,
                width: Get.width,
                child: Center(
                  child: _images == null
                      ? const Image(
                          image: AssetImage('assets/images/dash.png'),
                          fit: BoxFit.cover,
                        )
                      : FadeInImage.assetNetwork(
                          fadeInDuration: const Duration(milliseconds: 700),
                          placeholder: 'assets/images/dash.png',
                          image: _images.toString(),
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            Constant.box.write('setGame', 0);
                          });
                          Get.to(const EarningBoard(),
                              transition: Transition.fade);
                        },
                        child: Container(
                          width: 140,
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                  offset: Offset(0, 8),
                                  blurRadius: 2)
                            ],
                            color: Color(0xFF3300FF).withOpacity(0.35),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'EARN',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Gugi',
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                height: 1),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            Constant.box.write('setGame', 1);
                          });
                          Get.to(
                            const GameBoard(),
                            binding: ControllerBinding(),
                          );
                        },
                        child: Container(
                          width: 140,
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                  offset: Offset(0, 8),
                                  blurRadius: 2)
                            ],
                            color: Color(0xFF3300FF).withOpacity(0.35),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'PLAY',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Gugi',
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                height: 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        //Constant.box.write('setGame', false);
                      });
                    },
                    child: Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.25),
                              offset: Offset(0, 8),
                              blurRadius: 2)
                        ],
                        color: Color(0xFF3300FF).withOpacity(0.35),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'LEARN',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontFamily: 'Gugi',
                            fontSize: 30,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          /*  ),
          
         */
        ),
      ),
    );
  }
}
