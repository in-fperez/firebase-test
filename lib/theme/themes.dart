import 'package:flutter/material.dart';

class Themes {
  static ThemeData getDark() {
    return ThemeData(
      useMaterial3: true,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: 'Roboto',
      textTheme: textTheme,
      colorScheme: const ColorScheme(
          primary: Colors.black,
          onPrimary: Color.fromRGBO(255, 255, 255, 0.87),
          secondary: Color(0xff272727),
          onSecondary: Colors.white,
          tertiary: Color.fromRGBO(255, 159, 45, 1),
          onTertiary: Colors.black,
          error: Colors.redAccent,
          onError: Colors.white,
          brightness: Brightness.dark,
          background: Colors.black,
          onBackground: Color.fromRGBO(255, 255, 255, 0.87),
          surface: Color(0xff272727),
          onSurface: Colors.white),
      primarySwatch: Colors.grey,
      primaryColor: Colors.black,
      backgroundColor: Colors.black,
      canvasColor: Colors.black,
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(backgroundColor: Color(0xff272727)),
      textSelectionTheme: const TextSelectionThemeData(
        selectionColor: Colors.white,
      ),
    );
  }

  static ThemeData getLight() {
    return ThemeData(
      useMaterial3: true,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: 'Roboto',
      textTheme: textTheme,
      primarySwatch: Colors.deepPurple,
      primaryColor: Colors.white,
      colorScheme: const ColorScheme(
          primary: Colors.white,
          onPrimary: Colors.black,
          secondary: Color.fromRGBO(238, 232, 244, 1),
          onSecondary: Colors.black,
          tertiary: Color.fromRGBO(103, 80, 164, 1),
          onTertiary: Colors.white,
          error: Colors.redAccent,
          onError: Colors.white,
          brightness: Brightness.light,
          background: Color(0xFF79747E),
          onBackground: Colors.black,
          surface: Color.fromARGB(255, 222, 207, 232),
          onSurface: Colors.black),
      backgroundColor: const Color.fromRGBO(238, 232, 244, 1),
      indicatorColor: const Color(0xffCBDCF8),
      hintColor: const Color(0xffEECED3),
      canvasColor: const Color(0xffF1F5FB),
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromRGBO(238, 232, 244, 1),
          titleTextStyle: textTheme.headline3),
    );
  }
}

TextTheme textTheme = const TextTheme(
  headline1: TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 24,
  ),
  headline4: TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 16,
  ),
  headline5: TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 14,
  ),
  bodyText1: TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 14,
    letterSpacing: 0.25,
  ),
  bodyText2: TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 12,
    letterSpacing: 0.25,
  ),
);
