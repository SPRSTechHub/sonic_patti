import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'color_schemes.g.dart';

dynamic currentTime = DateTime.now();

//colors used in this app
const Color white = Colors.white;
const Color black = Colors.black;
const Color bgColor1 = Color(0xff312B4F);
const Color bgColor2 = Color(0xffAA8F00);
const Color bottomBarHeader = Color(0xFF001F24);
const Color bottomBarBg = Color(0xFF0B2722);
const Color navText = Color(0xffFFEDEA);

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
  static var kAppTextColor = GetStorage().read('IS_DARK_MODE')
      ? const Color(0xffFAFF00)
      : const Color(0xffFAFF00);

  static var kPrimaryBoxBackground = GetStorage().read('IS_DARK_MODE')
      ? darkColorScheme.background
      : lightColorScheme.background;

  var kBlackColor = Colors.black;

  static var kListCardGradient = Get.isDarkMode
      ? [
          ThemeData.dark().colorScheme.secondaryContainer,
          ThemeData.dark().colorScheme.surface
        ]
      : [
          ThemeData.light().colorScheme.error,
          ThemeData.light().colorScheme.tertiary
        ];

  static var kDigitGradient = GetStorage().read('IS_DARK_MODE')
      ? const [Color(0xff224839), Color(0xff002328)]
      : const [Color(0xff224839), Color(0xff002328)];

  static var kDigitGradientSelected = GetStorage().read('IS_DARK_MODE')
      ? const [Color(0xff333124), Color(0xff1E1C11)]
      : const [Color(0xff333124), Color(0xff1E1C11)];
}

class AppTextStyles {
  static var kLoginText = GoogleFonts.montserrat(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 16,
      letterSpacing: 0,
      fontWeight: FontWeight.bold,
      height: 1);

  static var kTextStyleWithFont1 = GoogleFonts.cairo;

  static var kReferText = GoogleFonts.itim(
      color: const Color.fromRGBO(255, 255, 255, 1),
      fontSize: 30,
      letterSpacing: 0,
      fontWeight: FontWeight.normal,
      height: 1);

  static var kGameheading2 = GoogleFonts.montserrat(
      fontSize: 10,
      color: Colors.white,
      letterSpacing: 0,
      fontWeight: FontWeight.bold,
      height: .5);

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

  static var kAtmCardTitle = GoogleFonts.jura(
      color: Colors.white70,
      fontSize: 20,
      letterSpacing: 0,
      fontWeight: FontWeight.normal,
      height: 1);

  static var kAtmCardBalanceText = GoogleFonts.josefinSans(
      color: Colors.white70,
      fontSize: 16,
      letterSpacing: 0,
      fontWeight: FontWeight.normal,
      height: 1);
  static var kAtmCardBalance = GoogleFonts.kameron(
      color: Colors.white70,
      fontSize: 20,
      letterSpacing: 0,
      fontWeight: FontWeight.bold,
      height: 1);

  static var kYellowBtnTitle = GoogleFonts.inter(
      color: const Color.fromRGBO(41, 36, 0, 1),
      fontSize: 16,
      letterSpacing: 0,
      fontWeight: FontWeight.bold,
      height: 1);

  static var kBetTextHeading = GoogleFonts.inter(
      color: const Color.fromRGBO(255, 255, 255, 1),
      letterSpacing: 0,
      fontSize: 14,
      fontWeight: FontWeight.bold,
      height: 1);

  static var kMktRtio = GoogleFonts.inter(
      color: Colors.black,
      letterSpacing: 0,
      fontSize: 10,
      fontWeight: FontWeight.bold,
      height: 1);

  static var kiconText = GoogleFonts.inter(
      shadows: const <Shadow>[
        Shadow(color: Colors.black, blurRadius: 1.0, offset: Offset.zero)
      ],
      color: Colors.white,
      fontSize: 12,
      letterSpacing: 0,
      fontWeight: FontWeight.bold,
      height: 1);

  static var kEarnTitleHeading = GoogleFonts.prompt(
      color: Colors.white,
      fontSize: 18,
      letterSpacing: 0,
      fontWeight: FontWeight.normal,
      height: 1);
}

class AppStyles {
  static var betBtn = BoxDecoration(
    borderRadius: BorderRadius.circular(8),
    color: const Color(0xFF014A56),
    boxShadow: const [
      BoxShadow(color: Color(0xff0096AE), offset: Offset(2, 2), blurRadius: 2)
    ],
  );

  static var yellowBtn = BoxDecoration(
    borderRadius: BorderRadius.circular(8),
    gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromRGBO(142, 111, 0, 1),
          Color.fromRGBO(249, 255, 0, 1),
          Color.fromRGBO(142, 111, 0, 1)
        ]),
  );
  static var buttonBg = BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    boxShadow: const [
      BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.45),
          offset: Offset(0, 3),
          blurRadius: 2)
    ],
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xffE3E1D5).withOpacity(0.6),
          const Color(0xff9AF0FF),
        ]),
  );
  static var buttonBgRound = BoxDecoration(
    borderRadius: BorderRadius.circular(28),
    boxShadow: const [
      BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.45),
          offset: Offset(0, 3),
          blurRadius: 2)
    ],
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xffE3E1D5).withOpacity(0.6),
          const Color(0xff9AF0FF),
        ]),
  );

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
  static var detailsProfileBg = BoxDecoration(
    borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30), topRight: Radius.circular(30)),
    boxShadow: [
      BoxShadow(
          color: const Color(0xff000000).withOpacity(0.4),
          offset: const Offset(0, -6),
          blurRadius: 2),
    ],
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xffD0FBE0),
          const Color(0xff9AF0FF).withOpacity(0.8)
        ]),
  );
}

class Constant {
  // Data Storage
  static final box = GetStorage();
  showSuccessSnack(String? data, context) {
    final SnackBar snakbar = SnackBar(
      content: Text(
        data!,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.blueAccent,
      elevation: 10,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(5),
    );
    ScaffoldMessenger.of(context).showSnackBar(snakbar);
  }

  showAlertSnack(String? data, context) {
    final SnackBar snakbar = SnackBar(
      content: Text(data!),
      backgroundColor: Colors.redAccent,
      elevation: 10,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(5),
    );
    ScaffoldMessenger.of(context).showSnackBar(snakbar);
  }

  showAlert(String? msg, context, Color? colorD) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => Dialog(
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: colorD ?? darkColorScheme.surface),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(msg!),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Close'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
