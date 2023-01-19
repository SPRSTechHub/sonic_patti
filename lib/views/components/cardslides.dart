import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildCard(int index) => Container(
      width: Get.width * .95,
      height: 120,
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
              color: Colors.black54.withOpacity(0.3),
              offset: const Offset(5, 7),
              blurRadius: 0.3)
        ],
        image: DecorationImage(
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.screen),
          image: const AssetImage('assets/images/offer1.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            '$index',
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
