import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonicpattilive/controllers/controller_binding.dart';
import 'package:sonicpattilive/controllers/home_controller.dart';
import 'package:sonicpattilive/utils/constants.dart';
import 'package:sonicpattilive/views/users/login.dart';
import 'package:sonicpattilive/views/users/mywallet.dart';

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
      backgroundColor: Theme.of(context).colorScheme.background,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
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
                    Text(
                      'SONIC PATTI',
                      style: AppTextStyles.kAtmCardBalance.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.bold),
                    ),
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
                        children: [
                          Icon(
                            Icons.money_off_csred_outlined,
                            color: Theme.of(context).colorScheme.secondary,
                            shadows: const <Shadow>[
                              Shadow(
                                  color: Colors.black,
                                  blurRadius: 1.0,
                                  offset: Offset.zero)
                            ],
                          ),
                          Text(
                            'Withdraw',
                            style: AppTextStyles.kiconText.copyWith(
                                color: Theme.of(context).colorScheme.secondary),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        children: [
                          Icon(
                            Icons.wifi_channel_outlined,
                            color: Theme.of(context).colorScheme.secondary,
                            shadows: const <Shadow>[
                              Shadow(
                                  color: Colors.black,
                                  blurRadius: 1.0,
                                  offset: Offset.zero)
                            ],
                          ),
                          Text(
                            'My Win',
                            style: AppTextStyles.kiconText.copyWith(
                                color: Theme.of(context).colorScheme.secondary),
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      child: GestureDetector(
                        onTap: () {
                          Constant.box.write('setGame', false);
                          Constant.box.write('isLogin', false);
                          Get.to(
                            LoginScreen(),
                            binding: ControllerBinding(),
                          );
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.logout_outlined,
                              color: Theme.of(context).colorScheme.secondary,
                              shadows: const <Shadow>[
                                Shadow(
                                    color: Colors.black,
                                    blurRadius: 1.0,
                                    offset: Offset.zero)
                              ],
                            ),
                            Text(
                              'Sign Out',
                              style: AppTextStyles.kiconText.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home_outlined,
              color: Theme.of(context).colorScheme.tertiary,
              shadows: const <Shadow>[
                Shadow(
                    color: Colors.black, blurRadius: 1.0, offset: Offset.zero)
              ],
            ),
            title: Text(
              'Home',
              style: AppTextStyles.kiconText.copyWith(
                  color: Theme.of(context).colorScheme.inverseSurface),
            ),
            onTap: () {
              Navigator.pop(context);
              setState(() {
                _mainController.changeTabIndex(0);
              });
            },
          ),
          const Divider(thickness: 1),
          ListTile(
            leading: Icon(
              Icons.verified_user_outlined,
              color: Theme.of(context).colorScheme.tertiary,
              shadows: const <Shadow>[
                Shadow(
                    color: Colors.black, blurRadius: 1.0, offset: Offset.zero)
              ],
            ),
            title: Text('My Profile',
                style: AppTextStyles.kiconText.copyWith(
                    color: Theme.of(context).colorScheme.inverseSurface)),
            onTap: () {
              Navigator.pop(context);
              setState(() {
                _mainController.changeTabIndex(1);
              });
            },
          ),
          const Divider(thickness: 1),
          ListTile(
            leading: Icon(
              Icons.ios_share_outlined,
              color: Theme.of(context).colorScheme.tertiary,
              shadows: const <Shadow>[
                Shadow(
                    color: Colors.black, blurRadius: 1.0, offset: Offset.zero)
              ],
            ),
            title: Text('Refer & Earn',
                style: AppTextStyles.kiconText.copyWith(
                    color: Theme.of(context).colorScheme.inverseSurface)),
            onTap: () {
              Navigator.pop(context);
              setState(() {
                _mainController.changeTabIndex(4);
              });
            },
          ),
          const Divider(thickness: 1),
          ListTile(
            leading: Icon(
              Icons.list_alt_outlined,
              color: Theme.of(context).colorScheme.tertiary,
              shadows: const <Shadow>[
                Shadow(
                    color: Colors.black, blurRadius: 1.0, offset: Offset.zero)
              ],
            ),
            title: Text('All Results',
                style: AppTextStyles.kiconText.copyWith(
                    color: Theme.of(context).colorScheme.inverseSurface)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(thickness: 1),
          ListTile(
            leading: Icon(
              Icons.wallet_membership_outlined,
              color: Theme.of(context).colorScheme.tertiary,
              shadows: const <Shadow>[
                Shadow(
                    color: Colors.black, blurRadius: 1.0, offset: Offset.zero)
              ],
            ),
            title: Text('My Wallet',
                style: AppTextStyles.kiconText.copyWith(
                    color: Theme.of(context).colorScheme.inverseSurface)),
            onTap: () {
              Navigator.pop(context);
              Get.to(
                const MyWallet(),
                binding: ControllerBinding(),
              );
            },
          ),
          const Divider(thickness: 1),
          ListTile(
            leading: Icon(
              Icons.support_agent_outlined,
              color: Theme.of(context).colorScheme.tertiary,
              shadows: const <Shadow>[
                Shadow(
                    color: Colors.black, blurRadius: 1.0, offset: Offset.zero)
              ],
            ),
            title: Text('Contact & Support',
                style: AppTextStyles.kiconText.copyWith(
                    color: Theme.of(context).colorScheme.inverseSurface)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
