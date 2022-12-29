import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

//colors used in this app
const Color white = Colors.white;
const Color black = Colors.black;
const Color bgColor1 = Color(0xFFAA8F00);
const Color bgColor2 = Color(0xFF393318);
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

class MyColor {
  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF6F5D00),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFFFE16B),
    onPrimaryContainer: Color(0xFF221B00),
    secondary: Color(0xFF0062A1),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFD0E4FF),
    onSecondaryContainer: Color(0xFF001D35),
    tertiary: Color(0xFF44664E),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFC5ECCD),
    onTertiaryContainer: Color(0xFF00210E),
    error: Color(0xFFBA1A1A),
    errorContainer: Color(0xFFFFDAD6),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410002),
    background: Color(0xFFFFFBFF),
    onBackground: Color(0xFF1D1B16),
    surface: Color(0xFFFFFBFF),
    onSurface: Color(0xFF1D1B16),
    surfaceVariant: Color(0xFFEAE2CF),
    onSurfaceVariant: Color(0xFF4B4739),
    outline: Color(0xFF7C7767),
    onInverseSurface: Color(0xFFF6F0E7),
    inverseSurface: Color(0xFF33302A),
    inversePrimary: Color(0xFFE4C542),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF6F5D00),
  );

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFE4C542),
    onPrimary: Color(0xFF3A3000),
    primaryContainer: Color(0xFF544600),
    onPrimaryContainer: Color(0xFFFFE16B),
    secondary: Color(0xFF9CCAFF),
    onSecondary: Color(0xFF003257),
    secondaryContainer: Color(0xFF00497B),
    onSecondaryContainer: Color(0xFFD0E4FF),
    tertiary: Color(0xFFAAD0B2),
    onTertiary: Color(0xFF153722),
    tertiaryContainer: Color(0xFF2C4E37),
    onTertiaryContainer: Color(0xFFC5ECCD),
    error: Color(0xFFFFB4AB),
    errorContainer: Color(0xFF93000A),
    onError: Color(0xFF690005),
    onErrorContainer: Color(0xFFFFDAD6),
    background: Color(0xFF1D1B16),
    onBackground: Color(0xFFE8E2D9),
    surface: Color(0xFF1D1B16),
    onSurface: Color(0xFFE8E2D9),
    surfaceVariant: Color(0xFF4B4739),
    onSurfaceVariant: Color(0xFFCDC6B4),
    outline: Color(0xFF979080),
    onInverseSurface: Color(0xFF1D1B16),
    inverseSurface: Color(0xFFE8E2D9),
    inversePrimary: Color(0xFF6F5D00),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFFE4C542),
  );
}
