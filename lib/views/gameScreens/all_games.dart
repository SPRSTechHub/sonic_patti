import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sonic_patti/views/components/catagories_panel.dart';
import 'package:sonic_patti/views/earnscreen/earnland.dart';

import '../../controllers/home_controller.dart';
import '../../utils/constants.dart';

class AllGames extends StatefulWidget {
  const AllGames({super.key});

  @override
  State<AllGames> createState() => _AllGamesState();
}

class _AllGamesState extends State<AllGames> {
  final HomeController _mainController = Get.find<HomeController>();

  static const List<Widget> fruits = <Widget>[Text('Play'), Text('Earn')];
  final List<bool> _selectedFruits = <bool>[false, true];
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
        child: Stack(
          fit: StackFit.loose,
          children: <Widget>[
            Column(
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
            Center(
              child: Container(
                height: 42,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.30),
                        offset: Offset(4, 6),
                        blurRadius: 8)
                  ],
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(221, 200, 0, 1),
                      Color.fromRGBO(255, 0, 0, 1)
                    ],
                  ),
                ),
                child: ToggleButtons(
                  direction: Axis.horizontal,
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  selectedBorderColor: fabBg,
                  selectedColor: Colors.white,
                  fillColor: bgColor1,
                  constraints:
                      const BoxConstraints(minHeight: 41.5, minWidth: 73.5),
                  isSelected: _selectedFruits,
                  children: fruits,
                  onPressed: (int index) {
                    setState(() {
                      if (index != 0) {
                        Get.to(const EarningBoard(),
                            transition: Transition.fade);
                      }
                    });
                  },
                ),
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
