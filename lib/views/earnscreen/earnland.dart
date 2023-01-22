import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonic_patti/utils/constants.dart';
import 'package:sonic_patti/views/gameScreens/gameboard.dart';

class EarningBoard extends StatefulWidget {
  const EarningBoard({super.key});

  @override
  State<EarningBoard> createState() => _EarningBoardState();
}

class _EarningBoardState extends State<EarningBoard> {
//  final HomeController _mainController = Get.find<HomeController>();

  static const List<Widget> fruits = <Widget>[Text('Play'), Text('Earn')];
  final List<bool> _selectedFruits = <bool>[true, false];
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: []),
      body: Container(
        color: AppColors.kPrimaryBoxBackground,
        child: SingleChildScrollView(
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
                  const SizedBox(
                    height: 700,
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
                          color: Color.fromRGBO(0, 0, 0, 0.30000001192092896),
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
                    selectedBorderColor: Theme.of(context).colorScheme.primary,
                    selectedColor: Colors.white,
                    fillColor: bgColor1,
                    constraints:
                        const BoxConstraints(minHeight: 41.5, minWidth: 73.5),
                    isSelected: _selectedFruits,
                    children: fruits,
                    onPressed: (int index) {
                      setState(() {
                        if (index != 1) {
                          Get.to(const GameBoard(),
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
      ),
    );
  }
}
