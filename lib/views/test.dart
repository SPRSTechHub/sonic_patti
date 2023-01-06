// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:intl/intl.dart';

class Testt extends StatefulWidget {
  const Testt({super.key});

  @override
  State<Testt> createState() => _TesttState();
}

class _TesttState extends State<Testt> {
  late CountdownTimerController controller;

  var dt = DateTime.now();

  /* 
  final mTime = '23:50';
  dynamic timeHour = int.parse('23:50'.substring(0, 2).toString());
  dynamic timeMinutes =
      int.parse('23:50'.substring('23:50'.length - 2).toString()); */
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;
  @override
  void initState() {
    super.initState();
  }

  void onEnd() {
    print('onEnd');
  }

  @override
  Widget build(BuildContext context) {
    /*  var one = DateFormat("HH:mm")
        .parse('${DateTime.now().hour}:${DateTime.now().minute}');
    var two = DateFormat("HH:mm").parse("23:50");
    int diff = int.parse(two.difference(one).toString());
    int endTime = Duration(milliseconds: diff).inMilliseconds; */
    return Scaffold(
      body: Center(
        child: CountdownTimer(
          /*    controller: controller, */
          onEnd: onEnd,
          endTime: endTime,
        ),
      ),
    );
  }
}
