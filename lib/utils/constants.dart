import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_schemes.g.dart';

//colors used in this app
const Color white = Colors.white;
const Color black = Colors.black;
const Color bgColor1 = Color(0xff312B4F);
const Color bgColor2 = Color(0xffAA8F00);

const Color appBarBg = Color(0xff93000A);
const Color appBarText = Color(0xFFFFEDEA);

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

class AppColors {
  var kPrimaryBoxBackground = GetStorage().read('IS_DARK_MODE')
      ? const Color(0xff002328)
      : const Color(0xff002328);
  var kBlackColor = Colors.black;

  static var kListCardGradient = GetStorage().read('IS_DARK_MODE')
      ? const [Color(0xff294E3B), Color(0xff00363D)]
      : const [Color.fromRGBO(41, 78, 59, 1), Color.fromRGBO(0, 54, 61, 1)];
}

class AppTextStyles {
  static var kTextStyleWithFont1 = GoogleFonts.cairo;
  var kTextStyleTwelveWithGreyColor = GoogleFonts.montserrat(
    fontSize: 12,
  );
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
