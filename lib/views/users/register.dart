import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sonic_patti/controllers/auth_controller.dart';
import 'package:sonic_patti/utils/constants.dart';
import 'package:sonic_patti/views/users/login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  late bool passwordVisibility;
  final token = Constant.box.read('fcmToken') ?? false;
  final fullnameCtltxt = TextEditingController();
  final mobileCtltxt = TextEditingController();
  final passwordCtltxt = TextEditingController();
  final referCtltxt = TextEditingController();
  final AuthController authController = Get.find<AuthController>();

  @override
  void initState() {
    passwordVisibility = false;
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
    return ModalProgressHUD(
      inAsyncCall: savingprogress,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
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
                    height: 120,
                  ),
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      image: const DecorationImage(
                          image: AssetImage('assets/icon/logo_sonic.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 370,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xff312B4F).withOpacity(0.8),
                    ),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 6),
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
                                labelText: 'Enter Your Full Name',
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
                                fillColor:
                                    Theme.of(context).colorScheme.background,
                                prefixIcon: Icon(
                                  Icons.person_outline,
                                  color: Theme.of(context).colorScheme.tertiary,
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
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Full Name required!';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 6),
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
                                fillColor:
                                    Theme.of(context).colorScheme.background,
                                prefixIcon: Icon(
                                  Icons.mobile_screen_share_outlined,
                                  color: Theme.of(context).colorScheme.tertiary,
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
                                  return 'Mobile Number required!';
                                } else if (value.length != 10) {
                                  return '10 digit Mobile Number!';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 6),
                            child: TextFormField(
                              controller: passwordCtltxt,
                              onChanged: (_) => EasyDebounce.debounce(
                                'passwordCtltxt',
                                const Duration(milliseconds: 2000),
                                () => setState(() {}),
                              ),
                              obscureText: !passwordVisibility,
                              decoration: InputDecoration(
                                isDense: true,
                                labelText: 'Your Password',
                                hintText: 'Enter Password here',
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
                                fillColor:
                                    Theme.of(context).colorScheme.background,
                                prefixIcon: Icon(
                                  Icons.key_off_outlined,
                                  color: Theme.of(context).colorScheme.tertiary,
                                ),
                                suffixIcon: InkWell(
                                  onTap: () => setState(
                                    () => passwordVisibility =
                                        !passwordVisibility,
                                  ),
                                  focusNode: FocusNode(skipTraversal: true),
                                  child: Icon(
                                    passwordVisibility
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                  ),
                                ),
                              ),
                              style: const TextStyle(fontSize: 16),
                              keyboardType: TextInputType.visiblePassword,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password missing!';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 6),
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
                                labelText: 'Enter Refer Id',
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
                                fillColor:
                                    Theme.of(context).colorScheme.background,
                                prefixIcon: Icon(
                                  Icons.person_outline,
                                  color: Theme.of(context).colorScheme.tertiary,
                                ),
                                suffixIcon: referCtltxt.text.isNotEmpty
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
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Full Name required!';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              var mobile = mobileCtltxt.text;
                              if (formKey.currentState!.validate() &&
                                  mobile.length == 10) {
                                var fullname = fullnameCtltxt.text;
                                var password = passwordCtltxt.text;
                                var referid = referCtltxt.text;
                                var response =
                                    await authController.signUpFunction(
                                        fullname,
                                        mobile,
                                        password,
                                        referid,
                                        token);
                                savingprogress = true;
                                if (response['status'] == 0) {
                                  setState(() {
                                    savingprogress = false;
                                    Constant().showSuccessSnack(
                                        response['message'], context);
                                    Get.to(const LoginScreen(),
                                        transition: Transition.upToDown);
                                  });
                                } else if (response['status'] == 1) {
                                  setState(() {
                                    savingprogress = false;
                                    Constant().showAlertSnack(
                                        response['message'], context);
                                  });
                                } else {
                                  setState(() {
                                    savingprogress = false;
                                    Constant().showAlertSnack(
                                        'Error detected!', context);
                                  });
                                }
                              }
                            },
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(vertical: 10.0),
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
                      GestureDetector(
                        onTap: (() {
                          setState(() {
                            Constant().showAlert('Comming soon!', context,
                                Theme.of(context).colorScheme.surface);
                          });
                        }),
                        child: Container(
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
        ),
      ),
    );
  }

  InputDecoration txtInp(
    String? lblHnt,
    Icon icoD,
  ) {
    return InputDecoration(
      filled: true,
      fillColor: Theme.of(context).colorScheme.background,
      hintText: lblHnt,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Color(0x00000000),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Color(0x00000000),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(0x00000000),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(0x00000000),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      prefixIcon: icoD,
    );
  }
}
