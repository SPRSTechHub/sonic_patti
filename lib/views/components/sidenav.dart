import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonic_patti/controllers/home_controller.dart';
import 'package:sonic_patti/views/gameScreens/gameboard.dart';
import 'package:sonic_patti/views/gameScreens/results.dart';
import 'package:sonic_patti/views/users/mywallet.dart';
import 'package:sonic_patti/views/users/referearn.dart';

class SideNav extends StatefulWidget {
  const SideNav({super.key});

  @override
  State<SideNav> createState() => _SideNavState();
}

class _SideNavState extends State<SideNav> {
  final HomeController _mainController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: const Image(
                          width: 60,
                          height: 60,
                          image: AssetImage("assets/icon/logo_sonic.png")),
                    ),
                    const Text('SONIC PATTI'),
                    IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Column(
                        children: const [
                          Icon(
                            Icons.money_off_csred_outlined,
                          ),
                          Text(
                            'Withdraw',
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        children: const [
                          Icon(
                            Icons.wifi_channel_outlined,
                          ),
                          Text(
                            'My Win',
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        children: const [
                          Icon(
                            Icons.logout_outlined,
                          ),
                          Text(
                            'Sign Out',
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              setState(() {
                _mainController.changeTabIndex(0);
                _mainController.tabIndex.value = 0;
                Get.to(const GameBoard());
              });
            },
          ),
          const Divider(thickness: 1),
          ListTile(
            leading: const Icon(Icons.verified_user_outlined),
            title: const Text('My Profile'),
            onTap: () {
              Navigator.pop(context);
              setState(() {
                _mainController.changeTabIndex(1);
              });
            },
          ),
          const Divider(thickness: 1),
          ListTile(
            leading: const Icon(Icons.ios_share_outlined),
            title: const Text('Refer & Earn'),
            onTap: () {
              Navigator.pop(context);
              setState(() {
                _mainController.changeTabIndex(4);
              });
            },
          ),
          const Divider(thickness: 1),
          ListTile(
            leading: const Icon(Icons.list_alt_outlined),
            title: const Text('All Results'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(thickness: 1),
          ListTile(
            leading: const Icon(Icons.wallet_membership_outlined),
            title: const Text('My Wallet'),
            onTap: () {
              Navigator.pop(context);
              Get.to(const MyWallet());
            },
          ),
          const Divider(thickness: 1),
          ListTile(
            leading: const Icon(Icons.support_agent_outlined),
            title: const Text('Contact & Support'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
