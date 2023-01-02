import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

//colors used in this app
const Color white = Colors.white;
const Color black = Colors.black;

const Color bgColor1 = Color(0xff312B4F);
const Color bgColor2 = Color(0xffAA8F00);

const Color appBarBg = Color(0xff93000A);
const Color appBarText = Color(0xFFFFEDEA);

const Color navBg = Color(0xff690005);
const Color navText = Color(0xffFFEDEA);
const Color navHighlighter = Color(0xffE4C542);

const Color fabBg = Color(0xFF0062A1);
const Color fabText = Color(0xffFFEDEA);

const Color appBody = Color(0xffAA8F00);
// heading for ob screen
const String ht1 = 'Play';
const String ht2 = 'Bid';
const String ht3 = 'Win';
// paragraph for ob screen
const String ob1 = 'Best Game for your daily interests';
const String ob2 = 'Play Win Success';
const String ob3 = 'Get Cash anytime';

//default app padding
const double appPadding = 20.0;
const double appmargin = 10.0;

class AppColors {
  static var gradientBackground = GetStorage().read('IS_DARK_MODE')
      ? [bgColor1, bgColor2]
      : [bgColor2, bgColor1];

  var kBoxCardGradient = GetStorage().read('IS_DARK_MODE')
      ? [const Color.fromRGBO(13, 13, 13, 1), const Color.fromRGBO(0, 0, 0, 1)]
      : [
          const Color(0xFF6200EE),
          Colors.deepPurple.shade300,
        ];

  var kPrimaryBackground = GetStorage().read('IS_DARK_MODE')
      ? const Color.fromRGBO(2, 2, 20, 1)
      : const Color.fromRGBO(193, 193, 193, 1);

  var kPrimaryBoxBackground = GetStorage().read('IS_DARK_MODE')
      ? const Color.fromARGB(255, 34, 34, 35)
      : const Color.fromRGBO(193, 193, 193, 1);

  var kPrimaryTextColor = GetStorage().read('IS_DARK_MODE')
      ? const Color(0xDDFFFFFF)
      : const Color(0xDD000000);

  var kSecondaryTextColor = GetStorage().read('IS_DARK_MODE')
      ? const Color(0x89FFFFFF)
      : const Color(0x89000000);

  var kListTileColor = GetStorage().read('IS_DARK_MODE')
      ? const Color(0x89FFFFFF)
      : const Color.fromARGB(136, 44, 42, 42);

  var kBlackColor = Colors.black;
}

class AppTextStyles {
  //static var kTextStyleWithFont = TextStyle(color: Colors.amber, fontFamily: GoogleFonts.montserrat());
  static var kTextStyleWithFont1 = GoogleFonts.cairo;

  static var kTextStyleElevenThemeColor = GoogleFonts.cairo(
      fontSize: 24,
      color: AppColors().kPrimaryTextColor,
      letterSpacing: 0.5,
      wordSpacing: 20);

  static var kTextStyleFourteenWithThemeColor = GoogleFonts.montserrat(
      fontSize: 14, color: AppColors().kPrimaryTextColor);

  var kTextStyleTwelveWithGreyColor = GoogleFonts.montserrat(
      fontSize: 12, color: AppColors().kSecondaryTextColor);

  var kTextStyletenWithGreyColor = GoogleFonts.montserrat(
      fontSize: 18, color: AppColors().kSecondaryTextColor);
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
}
