import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sonicpattilive/controllers/auth_controller.dart';
import 'package:sonicpattilive/controllers/cmc.dart';
import 'package:sonicpattilive/controllers/controller_binding.dart';
import 'package:sonicpattilive/utils/constants.dart';
import 'package:sonicpattilive/views/gameScreens/gameboard.dart';
import 'package:sonicpattilive/views/obscreen/screen_four.dart';
import 'package:sonicpattilive/views/splashscreen.dart';
import 'package:sonicpattilive/views/users/register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLogin = false;
  final token = Constant.box.read('fcmToken') ?? false;
  late TextEditingController textController;
  final formKey = GlobalKey<FormState>();
  final mobileCtltxt = TextEditingController();
  final passwordCtltxt = TextEditingController();
  late bool passwordVisibility;
  final ConnectionManagerController netController =
      Get.find<ConnectionManagerController>();
  final AuthController authController = Get.find<AuthController>();

  @override
  void initState() {
    super.initState();
    passwordVisibility = false;
    isLogin = Constant.box.read('isLogin') ?? false;
    if (isLogin == true) {
      Get.to(
        const MainScreen(),
        binding: ControllerBinding(),
      );
      /*  Get.to(
        const GameBoard(),
        binding: ControllerBinding(),
      ); */
    }
  }

  @override
  void dispose() {
    super.dispose();
    mobileCtltxt.dispose();
    passwordCtltxt.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: savingprogress,
      child: Scaffold(
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
                                savingprogress = false;
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
                            padding: const EdgeInsetsDirectional.all(14),
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
                                savingprogress = false;
                                return null;
                              },
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              savingprogress = true;
                              if (formKey.currentState!.validate()) {
                                var mobile = mobileCtltxt.text;
                                var password = passwordCtltxt.text;
                                var response = await authController
                                    .signInFunction(mobile, password, token);
                                print(response);
                                if (response == true) {
                                  savingprogress = false;
                                  await Get.deleteAll(force: true);
                                  Phoenix.rebirth(context);
                                  Get.to(
                                    const GameBoard(),
                                    binding: ControllerBinding(),
                                  );
                                } else {
                                  savingprogress = false;
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        focusColor: Theme.of(context).colorScheme.primary,
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
      ),
    );
  }
}
