import 'package:flutter/material.dart';
import 'package:sonic_patti/utils/constants.dart';

class TopAppBar extends StatefulWidget {
  const TopAppBar({super.key});

  @override
  State<TopAppBar> createState() => _TopAppBarState();
}

class _TopAppBarState extends State<TopAppBar> {
  bool shadowColor = false;

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
              Shadow(color: Colors.black, blurRadius: 1.0, offset: Offset.zero)
            ],
          ),
          onPressed: () {},
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
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('This is a snackbar')));
          },
        ),
      ],
      scrolledUnderElevation: 4.0,
      /*   backgroundColor: appBarBg,
        foregroundColor: appBarText, */
      shadowColor: shadowColor ? appBarBg.withAlpha(5) : appBarBg,
    );
  }
}
