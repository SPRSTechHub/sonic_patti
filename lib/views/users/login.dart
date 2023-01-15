import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonic_patti/controllers/cmc.dart';
import 'package:sonic_patti/utils/constants.dart';
import 'package:sonic_patti/views/gameScreens/gameboard.dart';
import 'package:sonic_patti/views/users/register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController textController;
  final formKey = GlobalKey<FormState>();
  final mobileCtltxt = TextEditingController();
  final passwordCtltxt = TextEditingController();
  bool isLogin = false;
  final ConnectionManagerController netController =
      Get.find<ConnectionManagerController>();

  @override
  void initState() {
    isLogin = Constant.box.read('isLogin') ?? false;
    final token = Constant.box.read('fcmToken') ?? false;
    print(token);

    if (isLogin == true) {
      Get.to(const GameBoard());
    }
    super.initState();
  }

  @override
  void dispose() {
    mobileCtltxt.dispose();
    passwordCtltxt.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: ,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          height: Get.height,
          width: Get.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/login_bg.png'),
                fit: BoxFit.cover),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 140,
                ),
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    image: const DecorationImage(
                        image: AssetImage('assets/icon/logo_sonic.png'),
                        fit: BoxFit.fitWidth),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 370,
                  decoration: AppStyles.loginFormBg,
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.all(14),
                          child: TextFormField(
                            controller: mobileCtltxt,
                            onChanged: (_) => EasyDebounce.debounce(
                              'textController',
                              const Duration(milliseconds: 2000),
                              () => setState(() {}),
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelText: 'Type Your Mobile Number',
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              filled: true,
                              fillColor: const Color(0x3CE0E3E7),
                              prefixIcon: Icon(
                                Icons.mobile_screen_share_outlined,
                                color: Colors.blueGrey.shade100,
                              ),
                              suffixIcon: mobileCtltxt.text.isNotEmpty
                                  ? InkWell(
                                      onTap: () => setState(
                                        () => mobileCtltxt.clear(),
                                      ),
                                      child: const Icon(
                                        Icons.clear,
                                        color: Color(0xFFFB0D0D),
                                        size: 22,
                                      ),
                                    )
                                  : null,
                            ),
                            style: const TextStyle(fontSize: 16),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.all(14),
                          child: TextFormField(
                            controller: passwordCtltxt,
                            onChanged: (_) => EasyDebounce.debounce(
                              'passwordCtltxt',
                              const Duration(milliseconds: 2000),
                              () => setState(() {}),
                            ),
                            obscureText: true,
                            decoration: InputDecoration(
                              isDense: true,
                              labelText: 'Set Your Password',
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              filled: true,
                              fillColor: const Color(0x3CE0E3E7),
                              prefixIcon: Icon(
                                Icons.password,
                                color: Colors.blueGrey.shade100,
                              ),
                              suffixIcon: passwordCtltxt.text.isNotEmpty
                                  ? InkWell(
                                      onTap: () => setState(
                                        () => passwordCtltxt.clear(),
                                      ),
                                      child: const Icon(
                                        Icons.clear,
                                        color: Color(0xFFFB0D0D),
                                        size: 22,
                                      ),
                                    )
                                  : null,
                            ),
                            style: const TextStyle(),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              setState(() {
                                Get.snackbar(
                                    'Alert!', 'Please enter all details!',
                                    duration: const Duration(seconds: 3),
                                    backgroundColor: bgColor1,
                                    snackPosition: SnackPosition.BOTTOM);
                              });
                              // to close this
                              //Navigator.of(context).pop();
                              var mobileNo = mobileCtltxt.text;
                              var passwordT = passwordCtltxt.text;
                            } else {
                              setState(() {
                                //hide Spinner
                                // Navigator.of(context).pop();
                              });
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 10.0),
                            width: 158,
                            height: 45,
                            decoration: AppStyles.registerBG,
                            child: Center(
                              child: Text(
                                'LOG IN',
                                textAlign: TextAlign.center,
                                style: AppTextStyles.kLoginText,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 158,
                      height: 45,
                      decoration: AppStyles.registerBG,
                      child: Center(
                        child: Text(
                          'FORGET',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.kLoginText,
                        ),
                      ),
                    ),
                    InkWell(
                      focusColor: fabBg,
                      onTap: (() => Get.to(const RegisterScreen(),
                          transition: Transition.fadeIn)),
                      child: Container(
                        width: 158,
                        height: 45,
                        decoration: AppStyles.registerBG,
                        child: Center(
                          child: Text(
                            'NEW ACCOUNT',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.kLoginText,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.only(top: 30.0),
                    child: Column(
                      children: const [
                        Icon(Icons.favorite_outline_outlined),
                        Text(
                          'Made With Love',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Inter',
                              fontSize: 10,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future spinner(context) {
  return showDialog(
    context: context,
    builder: (context) => const Center(
      child: CircularProgressIndicator(),
    ),
  );
}
