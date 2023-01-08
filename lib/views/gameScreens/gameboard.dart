import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonic_patti/controllers/home_controller.dart';
import 'package:sonic_patti/views/components/appbar.dart';
import 'package:sonic_patti/views/components/navigation.dart';
import 'package:sonic_patti/views/gameScreens/all_games.dart';
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _mainController.fetchCatagories();
        },
        elevation: _isVisible ? 0.0 : null,
        label: const Text('Fund'),
        icon: const Icon(Icons.add),
        /*   foregroundColor: fabText,
        backgroundColor: fabBg, */
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      bottomNavigationBar: navBar(
          isElevated: true, isVisible: _mainController.isVisible.value ?? true),
    );
  }

  Widget buildBody() {
    return Obx(() => IndexedStack(
          index: _mainController.tabIndex.value,
          children: const [AllGames(), Profile(), Bids(), Profile()],
        ));
  }
}

class Bids extends StatefulWidget {
  const Bids({super.key});

  @override
  State<Bids> createState() => _BidsState();
}

class _BidsState extends State<Bids> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Profile'),
    );
  }
}
