import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonic_patti/utils/constants.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({super.key});

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 40,
              width: Get.width * 9,
              margin:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: const [
                  BoxShadow(
                      color: Color(0XFF000000),
                      offset: Offset(0, 4),
                      blurRadius: 2)
                ],
                color: const Color(0xff011F23),
              ),
              child: const Text(
                'SELECT PAYMENT METHODE',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 20,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1),
              ),
            ),
            const SizedBox(
              height: 20,
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
                    color: bgColor1.withOpacity(.8),
                    elevation: 2,
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      height: 60,
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          SizedBox(
                            width: 80,
                            height: 40,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.elliptical(90, 90)),
                              child: Image(
                                  width: 80,
                                  height: 28,
                                  image:
                                      AssetImage("assets/images/upi_logo.png")),
                            ),
                          ),
                          Text(
                            'PAY BY UPI',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Inter',
                                fontSize: 20,
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                          Icon(Icons.arrow_right_alt_outlined,
                              color: Color(0xffE4E0EE)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Material(
                    color: bgColor1.withOpacity(.8),
                    elevation: 2,
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      height: 60,
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          SizedBox(
                            width: 80,
                            height: 40,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.elliptical(90, 90)),
                              child: Image(
                                  width: 80,
                                  height: 28,
                                  image:
                                      AssetImage("assets/images/upi_logo.png")),
                            ),
                          ),
                          Text(
                            'PAY BY UPI',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Inter',
                                fontSize: 20,
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                          Icon(Icons.arrow_right_alt_outlined,
                              color: Color(0xffE4E0EE)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Material(
                    color: bgColor1.withOpacity(.8),
                    elevation: 2,
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      height: 60,
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          SizedBox(
                            width: 80,
                            height: 40,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.elliptical(90, 90)),
                              child: Image(
                                  width: 80,
                                  height: 28,
                                  image:
                                      AssetImage("assets/images/nb_logo.png")),
                            ),
                          ),
                          Text(
                            'PAY BY NET BANKING',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Inter',
                                fontSize: 20,
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                          Icon(Icons.arrow_right_alt_outlined,
                              color: Color(0xffE4E0EE)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Material(
                    color: bgColor1.withOpacity(.8),
                    elevation: 2,
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      height: 60,
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          SizedBox(
                            width: 80,
                            height: 40,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.elliptical(90, 90)),
                              child: Image(
                                  width: 80,
                                  height: 28,
                                  image:
                                      AssetImage("assets/images/cf_logo.png")),
                            ),
                          ),
                          Text(
                            'Quick Pay',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Inter',
                                fontSize: 20,
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                          Icon(Icons.arrow_right_alt_outlined,
                              color: Color(0xffE4E0EE)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Material(
                    color: bgColor1.withOpacity(.8),
                    elevation: 2,
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      height: 60,
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          SizedBox(
                            width: 80,
                            height: 40,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.elliptical(90, 90)),
                              child: Image(
                                  width: 80,
                                  height: 28,
                                  image: AssetImage(
                                      "assets/images/phnp_logo.png")),
                            ),
                          ),
                          Text(
                            'PAY BY PHONPE',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Inter',
                                fontSize: 20,
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                          Icon(Icons.arrow_right_alt_outlined,
                              color: Color(0xffE4E0EE)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12.0),
              padding: const EdgeInsets.all(12.0),
              width: Get.width,
              height: 150,
              decoration: AppStyles.subGametopTimeBG,
              child: const Text('Payment Disclaimers'),
            ),
            const SizedBox(
              height: 70,
            ),
          ],
        ),
      ),
    );
  }
}
