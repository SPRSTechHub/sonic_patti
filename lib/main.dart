import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:get/get.dart';

import 'views/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

Color brandColor = const Color(0xffAA8F00);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
        builder: (ColorScheme? lightDynamic, ColorScheme? dark) {
      ColorScheme lightColorScheme;
      ColorScheme darkColorScheme;

      if (lightDynamic != null && dark != null) {
        lightColorScheme = lightDynamic.harmonized()..copyWith();
        lightColorScheme = lightDynamic.copyWith(secondary: brandColor);

        darkColorScheme = lightDynamic.harmonized();
        darkColorScheme = lightDynamic.copyWith(secondary: brandColor);
      } else {
        lightColorScheme = ColorScheme.fromSeed(
            seedColor: brandColor, brightness: Brightness.dark);
        darkColorScheme = ColorScheme.fromSeed(
            seedColor: brandColor, brightness: Brightness.light);
      }

      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme,
        ),
        darkTheme: ThemeData.dark()
            .copyWith(useMaterial3: true, colorScheme: darkColorScheme),
        themeMode: ThemeMode.system,
        home: const SplashScreen(),
      );
    });
  }
}
