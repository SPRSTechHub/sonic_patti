import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sonic_patti/controllers/home_controller.dart';
import 'package:sonic_patti/views/components/navigation.dart';
import 'package:sonic_patti/views/gameScreens/all_games.dart';

import '../../utils/constants.dart';

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

  bool shadowColor = false;
  double? scrolledUnderElevation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.menu_open_outlined,
            color: appBarText,
            shadows: <Shadow>[Shadow(color: Colors.white, blurRadius: 2.0)],
          ),
          onPressed: () {
            //
          },
        ),
        title: const Text('Sonic Patti'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.account_balance_wallet_outlined,
              color: navText,
              shadows: <Shadow>[Shadow(color: Colors.black, blurRadius: 15.0)],
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.notification_add,
              color: appBarText,
              shadows: <Shadow>[Shadow(color: Colors.white, blurRadius: 2.0)],
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
        ],
        scrolledUnderElevation: 4.0,
        backgroundColor: appBarBg,
        foregroundColor: appBarText,
        shadowColor: shadowColor ? appBarBg.withAlpha(5) : appBarBg,
      ),
      body: buildBody(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _mainController.fetchCatagories();
        },
        elevation: _isVisible ? 0.0 : null,
        label: const Text('Fund'),
        icon: const Icon(Icons.add),
        foregroundColor: fabText,
        backgroundColor: fabBg,
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

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container();
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
    return Center(
      child: Text('Profile'),
    );
  }
}
