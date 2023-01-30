import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sonic_patti/controllers/home_controller.dart';
import 'package:sonic_patti/utils/constants.dart';

class MyReferral extends StatefulWidget {
  const MyReferral({super.key});

  @override
  State<MyReferral> createState() => _MyReferralState();
}

class _MyReferralState extends State<MyReferral> {
  final HomeController _mainController = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 460,
          child: SizedBox(
            height: 420,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    width: 390,
                    height: 420,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromRGBO(34, 0, 148, 1),
                            Color.fromRGBO(138, 5, 251, 1)
                          ]),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'REFER your friends \nand EARN',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.kReferText,
                        ),
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: Lottie.asset(
                            'assets/anim/gifty1.json',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          'Share this code to any new user, \nYou get real play money everytime !',
                          textAlign: TextAlign.center,
                          style:
                              AppTextStyles.kReferText.copyWith(fontSize: 10),
                        ),
                        Container(
                          width: 300,
                          height: 72,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: const Color.fromRGBO(217, 217, 217, 0.20),
                            border: Border.all(
                              color: const Color.fromRGBO(237, 229, 229, 1),
                              width: 3,
                            ),
                          ),
                          child: Column(
                            children: [
                              const Text(
                                'Your Referral Code',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontFamily: 'Itim',
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    Constant.box.read('referId') ??
                                        'SPXXXXXXXX',
                                    textAlign: TextAlign.center,
                                    style: AppTextStyles.kAtmCardTitle.copyWith(
                                        fontSize: 30,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Copy \nCode',
                                    textAlign: TextAlign.center,
                                    style: AppTextStyles.kReferText.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 400,
                  left: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.telegram_outlined,
                          color: Colors.green,
                        ),
                        label: const Text('Telegram'),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.share_outlined,
                          color: Colors.green,
                        ),
                        label: const Text('Share'),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          _onShare(context);
                        },
                        icon: const Icon(
                          Icons.whatshot_sharp,
                          color: Colors.green,
                        ),
                        label: const Text('WhatsApp'),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
          child:
              Text('We will  add more details for referrals income here soon'),
        )
      ],
    ));
  }

  void _onShare(BuildContext context) async {
    final box = context.findRenderObject() as RenderBox?;
    var referinfo = _mainController.fetchAppLink();
    print(referinfo['status']);
    if (_mainController.referDetails.value != '') {
      print(_mainController.referDetails.value);
      //return Obx(() => Text(_mainController.referDetails.value));
    }
    /* await Share.share(
        'Hey download & start playing Sonic with this Referid & get Joining Bonus. \nLink: https://digitalsprs.fun',
        subject: 'Sonic Patti',
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size); */
  }
}
