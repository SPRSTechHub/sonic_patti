import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sonic_patti/views/components/catagories_panel.dart';

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
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors().kPrimaryBoxBackground,
      child: SingleChildScrollView(
        controller: _mainController.scrollController,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 4,
            ),
            SizedBox(
              height: 180,
              width: Get.width,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return buildCard(index);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 6,
                    );
                  },
                  itemCount: 5),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 32,
              width: Get.width,
              color: Colors.red,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 700,
              child: Center(
                child: Obx(() {
                  if (_mainController.isDataProcessing.value == true) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (_mainController.catLists.isNotEmpty) {
                      return const ListofGames();
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Lottie.asset(
                            'assets/anim/loading1.json',
                            fit: BoxFit.fill,
                          ),
                          const Text('Games are loading ....'),
                        ],
                      );
                    }
                  }
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard(int index) => Container(
        width: Get.width * .9,
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
            colorFilter: ColorFilter.mode(
                Colors.blue.withOpacity(0.3), BlendMode.screen),
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
}
