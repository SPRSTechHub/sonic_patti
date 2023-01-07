// ignore_for_file: non_constant_identifier_names
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
