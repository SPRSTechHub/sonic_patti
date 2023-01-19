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
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 230,
            child: Stack(children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  width: Get.width,
                  height: 120,
                  decoration: BoxDecoration(
                    color:
                        const Color.fromRGBO(217, 217, 217, 1).withOpacity(0.6),
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
                  top: 180,
                  left: Get.width * .42,
                  child: Text(Constant.box.read('userid'),
                      textAlign: TextAlign.left,
                      style: AppTextStyles.kAtmCardBalanceText)),
              Positioned(
                  top: 200,
                  left: Get.width * .42,
                  child: Text(Constant.box.read('mobile'),
                      textAlign: TextAlign.left,
                      style: AppTextStyles.kAtmCardBalanceText)),
            ]),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.topLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  width: Get.width,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:
                        const Color.fromRGBO(245, 245, 245, 0.1599999964237213),
                  ),
                  child: const Text(
                    'CONTENTS',
                    textAlign: TextAlign.left,
                  ),
                ),
                const Text(
                  'CONTENTS',
                  textAlign: TextAlign.left,
                ),
                const Text(
                  'CONTENTS',
                  textAlign: TextAlign.left,
                )
              ],
            ),
          ),
        ],
      ),
    );
    /* ; */
  }
}

/*
  
    
    */
