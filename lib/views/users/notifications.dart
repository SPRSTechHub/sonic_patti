import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final HomeController _mainController = Get.find<HomeController>();
  @override
  void initState() {
    _mainController.fetchOffers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text('data');
  }
}
