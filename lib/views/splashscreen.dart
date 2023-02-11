import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonic_patti/views/users/login.dart';

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
    Timer(const Duration(seconds: 5), () {
      Get.off(LoginScreen(), transition: Transition.circularReveal);
    });
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
  /*
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() {
          if (_controller.isDeviceConnected.value == false) {
            return const Text('No Internet');
          } else {
            return const Text('Got Internet');
          }
        }),
      ),
    );
  } */
}
