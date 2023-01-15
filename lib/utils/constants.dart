import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'color_schemes.g.dart';

dynamic currentTime = DateTime.now();

//colors used in this app
const Color white = Colors.white;
const Color black = Colors.black;
const Color bgColor1 = Color(0xff312B4F);
const Color bgColor2 = Color(0xffAA8F00);

const Color appBarBg = Color(0xff93000A);
const Color appBarText = Color(0xFFFFEDEA);

const Color bottomBarHeader = Color(0xFF001F24);
const Color bottomBarBg = Color(0xFF0B2722);

//ColorScheme.fromSeed(seedColor: brandColor); // Color(0xff690005);
Color navBgDark = darkColorScheme.surface;
Color navBgLight = lightColorScheme.surface;

const Color navText = Color(0xffFFEDEA);
const Color navHighlighter = Color(0xffE4C542);

const Color fabBg = Color(0xFF0062A1);
const Color fabText = Color(0xffFFEDEA);
// heading for ob screen
const String ht1 = 'Play';
const String ht2 = 'Bid';
const String ht3 = 'Win';
// paragraph for ob screen
const String ob1 = 'Best Game for your daily interests';
const String ob2 = 'Play Win Success';
const String ob3 = 'Get Cash anytime';

const double appPadding = 20.0;
const double appmargin = 10.0;

const isLogin = false;

class AppColors {
  var kPrimaryBoxBackground = GetStorage().read('IS_DARK_MODE')
      ? const Color(0xff002328)
      : const Color(0xff002328);

  var kBlackColor = Colors.black;

  static var kListCardGradient = GetStorage().read('IS_DARK_MODE')
      ? const [Color(0xff294E3B), Color(0xff00363D)]
      : const [Color.fromRGBO(41, 78, 59, 1), Color.fromRGBO(0, 54, 61, 1)];

  static var kDigitGradient = GetStorage().read('IS_DARK_MODE')
      ? const [Color(0xff224839), Color(0xff002328)]
      : const [Color(0xff224839), Color(0xff002328)];

  static var kDigitGradientSelected = GetStorage().read('IS_DARK_MODE')
      ? const [Color(0xff333124), Color(0xff1E1C11)]
      : const [Color(0xff333124), Color(0xff1E1C11)];

  static var kInputColor = GetStorage().read('IS_DARK_MODE')
      ? const Color(0xffffffff)
      : const Color(0xff002328);
  static var kInputColorBG = GetStorage().read('IS_DARK_MODE')
      ? const Color(0xff002328)
      : const Color(0xff002328);
}

class AppTextStyles {
  static var kLoginText = GoogleFonts.montserrat(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 16,
      letterSpacing: 0,
      fontWeight: FontWeight.bold,
      height: 1);

  static var kTextStyleWithFont1 = GoogleFonts.cairo;

  var kTextStyleTwelveWithGreyColor = GoogleFonts.montserrat(
    fontSize: 12,
  );

  static var kSubGameTitle = GoogleFonts.montserrat(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 16,
      letterSpacing: 0,
      fontWeight: FontWeight.bold,
      height: 1);

  static var kGameTime = GoogleFonts.oxanium(
      color: Colors.white70,
      fontSize: 12,
      letterSpacing: 0,
      fontWeight: FontWeight.normal,
      height: 1);
}

class AppStyles {
  static var backgrounds = const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment(0.8, 1),
      colors: <Color>[
        Color(0xFFCA8243),
        Color(0xFF511504),
      ],
      tileMode: TileMode.mirror,
    ),
  );

  static var subGameListBg = BoxDecoration(
    borderRadius: BorderRadius.circular(18),
    boxShadow: const [
      BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.25),
          offset: Offset(0, 4),
          blurRadius: 4)
    ],
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: AppColors.kListCardGradient,
    ),
  );

  static var timerBG = BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromRGBO(252, 0, 197, 0.56),
          Color.fromRGBO(0, 35, 40, 1)
        ]),
  );

  static var subGameBetStatusBG = BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromRGBO(0, 255, 176, 1),
          Color.fromRGBO(249, 255, 0, 0.5)
        ]),
  );

  static var subGametopTimeBG = const BoxDecoration(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(0),
      topRight: Radius.circular(0),
      bottomLeft: Radius.circular(14),
      bottomRight: Radius.circular(14),
    ),
    boxShadow: [
      BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.25),
          offset: Offset(0, 2),
          blurRadius: 1)
    ],
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color.fromRGBO(36, 74, 58, 0), Color.fromRGBO(7, 28, 22, 1)]),
  );

  static var registerBG = BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    boxShadow: const [
      BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.25),
          offset: Offset(4, 8),
          blurRadius: 2)
    ],
    border: Border.all(
      color: const Color.fromRGBO(0, 0, 0, 1),
      width: .5,
    ),
    gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFFFBE421), Color(0xFFBA1A1A), Color(0xFF7D0000)]),
  );

  static var loginFormBg = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    gradient: const LinearGradient(
        begin: Alignment(6.123234262925839e-17, 1),
        end: Alignment(-1, 6.123234262925839e-17),
        colors: [
          Color.fromRGBO(0, 0, 0, 0.44999998807907104),
          Color.fromRGBO(217, 217, 217, 0.15000000596046448),
          Color.fromRGBO(0, 0, 0, 0.44999998807907104)
        ]),
  );
}

class Constant {
  // Data Storage
  static final box = GetStorage();
}
