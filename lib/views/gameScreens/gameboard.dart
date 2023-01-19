import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonic_patti/controllers/home_controller.dart';
import 'package:sonic_patti/views/components/appbar.dart';
import 'package:sonic_patti/views/components/navigation.dart';
import 'package:sonic_patti/views/components/sidenav.dart';
import 'package:sonic_patti/views/gameScreens/all_games.dart';
import 'package:sonic_patti/views/gameScreens/allbids.dart';
import 'package:sonic_patti/views/gameScreens/results.dart';
import 'package:sonic_patti/views/users/mywallet.dart';
import 'package:sonic_patti/views/users/profileScreen.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({super.key});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  final HomeController _mainController = Get.find<HomeController>();
  final _isVisible = true;
  @override
  void initState() {
    setState(() {
      _mainController.fetchUserDetails();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  double? scrolledUnderElevation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56.0),
        child: TopAppBar(),
      ),
      body: buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _mainController.fetchCatagories();
          Get.to(const MyWallet(), transition: Transition.leftToRightWithFade);
        },
        elevation: _isVisible ? 8.0 : null,
        child: const Icon(
          Icons.bolt_outlined,
          size: 24,
          shadows: <Shadow>[
            Shadow(color: Colors.white, blurRadius: 6.0, offset: Offset.zero)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      bottomNavigationBar: nav(),
      drawer: const SideNav(),
    );
  }

  Widget nav() {
    return Obx(
      () => navBar(
          index: _mainController.tabIndex.value,
          isElevated: true,
          isVisible: _mainController.isVisible.value),
    );
  }

  Widget buildBody() {
    return Obx(() => IndexedStack(
          index: _mainController.tabIndex.value,
          children: const [AllGames(), Profile(), AllBids(), Results()],
        ));
  }
}
