import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonic_patti/utils/constants.dart';
import 'package:sonic_patti/views/users/mywallet.dart';
import 'package:sonic_patti/views/users/notifications.dart';

import '../../controllers/controller_binding.dart';
import '../users/login.dart';

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
          Navigator.pop(context);
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
      title: Text(
        'Sonic Patti',
        style: AppTextStyles.kAtmCardBalance.copyWith(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.bold),
      ),
      actions: <Widget>[
        GestureDetector(
          onTap: (() {
            Get.to(const MyWallet(),
                binding: ControllerBinding(),
                transition: Transition.leftToRightWithFade);
          }),
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.account_balance_wallet_outlined,
                  size: Get.width * .060,
                  color: Theme.of(context).colorScheme.primary,
                  shadows: const <Shadow>[
                    Shadow(
                        color: Colors.black,
                        blurRadius: 1.0,
                        offset: Offset.zero)
                  ],
                ),
                Text(
                  '₹ ${uwbal ?? 0}',
                  style: AppTextStyles.kiconText.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),
        ),
        Badge(
          backgroundColor: Colors.red,
          textColor: Colors.white,
          smallSize: 10,
          padding: const EdgeInsets.all(2.0),
          alignment: AlignmentDirectional.center,
          child: IconButton(
            icon: Icon(
              Icons.notification_add,
              color: Theme.of(context).colorScheme.primary,
              shadows: const <Shadow>[
                Shadow(
                    color: Colors.white, blurRadius: 2.0, offset: Offset.zero)
              ],
            ),
            onPressed: () {
              Get.to(const Notifications(),
                  transition: Transition.leftToRightWithFade);
            },
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.logout,
            color: Theme.of(context).colorScheme.primary,
            shadows: const <Shadow>[
              Shadow(color: Colors.white, blurRadius: 2.0, offset: Offset.zero)
            ],
          ),
          onPressed: () {
            //Logout
            Constant.box.write('isLogin', false);
            Get.to(
              LoginScreen(),
              binding: ControllerBinding(),
            );
          },
        ),
      ],
      scrolledUnderElevation: 4.0,
      shadowColor: Theme.of(context).colorScheme.surfaceTint,
      backgroundColor: Theme.of(context).colorScheme.surface,
    );
  }
}
