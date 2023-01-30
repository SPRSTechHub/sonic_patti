import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonic_patti/utils/constants.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 230,
            child: Stack(alignment: Alignment.center, children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  width: Get.width,
                  height: 120,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/profl_bg.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 78,
                left: Get.width * .40,
                child: Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(217, 217, 217, 1),
                    border: Border.all(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      width: 3,
                    ),
                    borderRadius:
                        const BorderRadius.all(Radius.elliptical(90, 90)),
                  ),
                  child: const ClipRRect(
                    borderRadius: BorderRadius.all(Radius.elliptical(90, 90)),
                    child: Image(
                        width: 90,
                        height: 90,
                        image: AssetImage("assets/icon/logo_sonic.png")),
                  ),
                ),
              ),
              Positioned(
                top: 70,
                left: Get.width * .54,
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: IconButton(
                    icon: Icon(
                      Icons.add_a_photo_outlined,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    onPressed: () {
                      print('Add phot func');
                    },
                  ),
                ),
              ),
              Positioned(
                  top: 180,
                  child: Text('Userid: ${Constant.box.read('userid')}',
                      textAlign: TextAlign.left,
                      style: AppTextStyles.kAtmCardBalanceText.copyWith(
                          color: Theme.of(context).colorScheme.tertiary))),
              Positioned(
                  top: 200,
                  child: Text('Mobile: ${Constant.box.read('mobile')}',
                      textAlign: TextAlign.left,
                      style: AppTextStyles.kAtmCardBalanceText.copyWith(
                          color: Theme.of(context).colorScheme.tertiary))),
            ]),
          ),
          SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 18.0),
                  decoration: AppStyles.buttonBgRound,
                  child: Text(
                    'EDIT PROFILE',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.kYellowBtnTitle,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 18.0),
                  decoration: AppStyles.buttonBgRound,
                  child: Text(
                    'BANK DETAILS',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.kYellowBtnTitle,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.topLeft,
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(8),
              children: <Widget>[
                Material(
                  color: Theme.of(context).colorScheme.secondary,
                  elevation: 8,
                  borderRadius: BorderRadius.circular(8),
                  child: SwitchListTile(
                    activeColor: Theme.of(context).colorScheme.tertiary,
                    inactiveThumbColor: Theme.of(context).colorScheme.surface,
                    title: const Text('PROFILE UPDATE'),
                    value: Constant.box.read('IS_DARK_MODE') ? true : false,
                    onChanged: (bool? value) {
                      setState(() {
                        Constant.box.write('IS_DARK_MODE', value);
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Material(
                  color: Theme.of(context).colorScheme.secondary,
                  elevation: 8,
                  borderRadius: BorderRadius.circular(8),
                  child: SwitchListTile(
                    activeColor: Theme.of(context).colorScheme.tertiary,
                    inactiveThumbColor: Theme.of(context).colorScheme.surface,
                    title: const Text('ACCOUNT UPDATE'),
                    value: Constant.box.read('IS_DARK_MODE') ? true : false,
                    onChanged: (bool? value) {
                      setState(() {
                        //Constant.box.write('IS_DARK_MODE', value);
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Material(
                  color: Theme.of(context).colorScheme.secondary,
                  elevation: 8,
                  borderRadius: BorderRadius.circular(8),
                  child: SwitchListTile(
                    activeColor: Theme.of(context).colorScheme.tertiary,
                    inactiveThumbColor: Theme.of(context).colorScheme.surface,
                    title: Text(
                        'APP THEME MODE: ${Constant.box.read('IS_DARK_MODE') ? 'DARK' : 'LIGHT'}'),
                    value: Constant.box.read('IS_DARK_MODE') ? true : false,
                    onChanged: (bool? value) {
                      setState(() {
                        //Constant.box.write('IS_DARK_MODE', value);
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Material(
                  color: Theme.of(context).colorScheme.secondary,
                  elevation: 8,
                  borderRadius: BorderRadius.circular(8),
                  child: SwitchListTile(
                    activeColor: Theme.of(context).colorScheme.tertiary,
                    inactiveThumbColor: Theme.of(context).colorScheme.surface,
                    title: Text(
                        'NOTIFICATIONS: ${Constant.box.read('IS_DARK_MODE') ? 'YES' : 'NO'}'),
                    value: Constant.box.read('IS_DARK_MODE') ? true : false,
                    onChanged: (bool? value) {
                      setState(() {
                        //Constant.box.write('IS_DARK_MODE', value);
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Material(
                  color: Theme.of(context).colorScheme.secondary,
                  elevation: 8,
                  borderRadius: BorderRadius.circular(8),
                  child: SwitchListTile(
                    activeColor: Theme.of(context).colorScheme.tertiary,
                    inactiveThumbColor: Theme.of(context).colorScheme.surface,
                    title: Text(
                        'PASSCODE LOCK: ${Constant.box.read('IS_DARK_MODE') ? 'YES' : 'NO'}'),
                    value: Constant.box.read('IS_DARK_MODE') ? true : false,
                    onChanged: (bool? value) {
                      setState(() {
                        //Constant.box.write('IS_DARK_MODE', value);
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Material(
                  color: Theme.of(context).colorScheme.secondary,
                  elevation: 8,
                  borderRadius: BorderRadius.circular(8),
                  child: SwitchListTile(
                    activeColor: Theme.of(context).colorScheme.tertiary,
                    inactiveThumbColor: Theme.of(context).colorScheme.surface,
                    title: const Text('APP UPDATE'),
                    value: Constant.box.read('IS_DARK_MODE') ? true : false,
                    onChanged: (bool? value) {
                      setState(() {
                        //Constant.box.write('IS_DARK_MODE', value);
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
