import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonic_patti/controllers/home_controller.dart';
import 'package:sonic_patti/views/components/navigation.dart';
import 'package:sonic_patti/views/gameScreens/all_games.dart';
import 'package:sonic_patti/views/users/profileScreen.dart';

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
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu_open_outlined,
            color: Theme.of(context).colorScheme.primary,
            shadows: const <Shadow>[
              Shadow(color: Colors.white, blurRadius: 2.0, offset: Offset.zero)
            ],
          ),
          onPressed: () {
            //
          },
        ),
        title: const Text('Sonic Patti'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.account_balance_wallet_outlined,
              color: Theme.of(context).colorScheme.primary,
              shadows: const <Shadow>[
                Shadow(
                    color: Colors.black, blurRadius: 1.0, offset: Offset.zero)
              ],
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.notification_add,
              color: Theme.of(context).colorScheme.primary,
              shadows: const <Shadow>[
                Shadow(
                    color: Colors.white, blurRadius: 2.0, offset: Offset.zero)
              ],
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
        ],
        scrolledUnderElevation: 4.0,
        /*   backgroundColor: appBarBg,
        foregroundColor: appBarText, */
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
    return Center(
      child: Text('Profile'),
    );
  }
}
