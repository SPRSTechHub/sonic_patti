import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonic_patti/utils/constants.dart';
import 'package:sonic_patti/views/users/mywallet.dart';
import 'package:sonic_patti/views/users/notifications.dart';

class TopAppBar extends StatefulWidget {
  const TopAppBar({super.key, this.istate});
  final int? istate;
  @override
  State<TopAppBar> createState() => _TopAppBarState();
}

class _TopAppBarState extends State<TopAppBar> {
  bool shadowColor = false;
  final uwbal = Constant.box.read('uwbal');
  @override
  void initState() {
    super.initState();
  }

  setLeading() {
    if (widget.istate == 0) {
      return IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new_outlined,
          color: Theme.of(context).colorScheme.primary,
          shadows: const <Shadow>[
            Shadow(color: Colors.white, blurRadius: 2.0, offset: Offset.zero)
          ],
        ),
        onPressed: () {
          Get.back();
        },
      );
    } else {
      return IconButton(
        icon: Icon(
          Icons.menu_open_outlined,
          color: Theme.of(context).colorScheme.primary,
          shadows: const <Shadow>[
            Shadow(color: Colors.white, blurRadius: 2.0, offset: Offset.zero)
          ],
        ),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: setLeading(),
      title: const Text('Sonic Patti'),
      actions: <Widget>[
        Badge(
          position: BadgePosition.bottomEnd(bottom: -4, end: -4),
          elevation: 0,
          shape: BadgeShape.circle,
          badgeContent: Text(
            '₹ ${uwbal ?? 0}',
            style: const TextStyle(fontSize: 10),
          ),
          badgeColor: Colors.red,
          borderSide: const BorderSide(color: Colors.black),
          child: const Icon(
            Icons.person,
            size: 30,
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.account_balance_wallet_outlined,
            color: Theme.of(context).colorScheme.primary,
            shadows: const <Shadow>[
              Shadow(color: Colors.black, blurRadius: 1.0, offset: Offset.zero)
            ],
          ),
          onPressed: () {
            Get.to(const MyWallet(), transition: Transition.fadeIn);
          },
        ),
        IconButton(
          icon: Icon(
            Icons.notification_add,
            color: Theme.of(context).colorScheme.primary,
            shadows: const <Shadow>[
              Shadow(color: Colors.white, blurRadius: 2.0, offset: Offset.zero)
            ],
          ),
          onPressed: () {
            Get.to(const Notifications(),
                transition: Transition.leftToRightWithFade);
          },
        ),
      ],
      scrolledUnderElevation: 4.0,
      shadowColor: shadowColor ? appBarBg.withAlpha(5) : appBarBg,
    );
  }
}
