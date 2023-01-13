import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonic_patti/utils/constants.dart';
import 'package:sonic_patti/views/users/login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  final fullnameCtltxt = TextEditingController();
  final mobileCtltxt = TextEditingController();
  final passwordCtltxt = TextEditingController();
  final referCtltxt = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    fullnameCtltxt.dispose();
    mobileCtltxt.dispose();
    passwordCtltxt.dispose();
    referCtltxt.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: ,
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/register_bg.png'),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 140,
              ),
              Container(
                width: 72,
                height: 72,
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                      begin: Alignment(6.123234262925839e-17, 1),
                      end: Alignment(-1, 6.123234262925839e-17),
                      colors: [
                        Color.fromRGBO(0, 0, 0, 0.44999998807907104),
                        Color.fromRGBO(217, 217, 217, 0.15000000596046448),
                        Color.fromRGBO(0, 0, 0, 0.44999998807907104)
                      ]),
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.all(14),
                        child: TextFormField(
                          controller: fullnameCtltxt,
                          onChanged: (_) => EasyDebounce.debounce(
                            'textController',
                            const Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            labelText: 'What is Your Name?',
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
                              Icons.mail_outlined,
                              color: Colors.blueGrey.shade100,
                            ),
                            suffixIcon: fullnameCtltxt.text.isNotEmpty
                                ? InkWell(
                                    onTap: () => setState(
                                      () => fullnameCtltxt.clear(),
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
                          keyboardType: TextInputType.name,
                        ),
                      ),
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
                      Padding(
                        padding: const EdgeInsetsDirectional.all(14),
                        child: TextFormField(
                          controller: referCtltxt,
                          onChanged: (_) => EasyDebounce.debounce(
                            'textController',
                            const Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            labelText: 'REFER ID IF YOU HAVE!',
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
                              Icons.child_friendly_outlined,
                              color: Colors.blueGrey.shade100,
                            ),
                            suffixIcon: fullnameCtltxt.text.isNotEmpty
                                ? InkWell(
                                    onTap: () => setState(
                                      () => referCtltxt.clear(),
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
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      Container(
                        width: 158,
                        height: 45,
                        decoration: AppStyles.registerBG,
                        child: Center(
                          child: Text(
                            'REGISTER',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.kLoginText,
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
                        'SOCIAL LOGIN',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.kLoginText,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(const LoginScreen(),
                          transition: Transition.circularReveal);
                    },
                    child: Container(
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
    );
  }
}
