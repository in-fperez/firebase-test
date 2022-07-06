import 'package:firebase_testv2/constants/constants.dart';
import 'package:flutter/material.dart';

class Themes {
  static ThemeData getDark() {
    return ThemeData(
      useMaterial3: true,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: 'Roboto',
      textTheme: sharedTextTheme,
      colorScheme: const ColorScheme(
          primary: Colors.black,
          onPrimary: Color.fromRGBO(255, 255, 255, 0.87),
          secondary: Color(0xff272727),
          onSecondary: Colors.white,
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
      appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
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
      textTheme: sharedTextTheme,
      primarySwatch: Colors.deepPurple,
      primaryColor: Colors.white,
      colorScheme: const ColorScheme(
          primary: Colors.white,
          onPrimary: Colors.black,
          secondary: Color.fromRGBO(238, 232, 244, 1),
          onSecondary: Colors.black,
          error: Colors.redAccent,
          onError: Colors.white,
          brightness: Brightness.light,
          background: Color(0xFF79747E),
          onBackground: Colors.black,
          surface: Color(0xFF79747E),
          onSurface: Colors.black),
      backgroundColor: const Color.fromRGBO(238, 232, 244, 1),
      indicatorColor: const Color(0xffCBDCF8),
      hintColor: const Color(0xffEECED3),
      canvasColor: const Color(0xffF1F5FB),
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromRGBO(238, 232, 244, 1), titleTextStyle: sharedTextTheme.headline3),
    );
  }
}

TextTheme sharedTextTheme = const TextTheme(
  headline1: TextStyle(
    color: Color(0xFF2B2E4A),
    fontWeight: FontWeight.w600,
    fontSize: 34,
  ),
  headline2: TextStyle(color: Color(0xFF2B2E4A), fontWeight: FontWeight.w400, fontSize: 22, height: 28),
  headline3: TextStyle(
    color: Color(0xFF2B2E4A),
    fontWeight: FontWeight.bold,
    fontSize: 18,
  ),
  headline4: TextStyle(
    color: Color(0xFF2B2E4A),
    fontWeight: FontWeight.bold,
    fontSize: 16,
  ),
  headline5: TextStyle(
    color: Color(0xFF2B2E4A),
    fontWeight: FontWeight.bold,
    fontSize: 14,
  ),
  headline6: TextStyle(
    color: Color(0xFF2B2E4A),
    fontWeight: FontWeight.normal,
    fontSize: 14,
  ),
  bodyText1: TextStyle(
    color: Color(0xFF2B2E4A),
    fontWeight: FontWeight.normal,
    fontSize: 12,
  ),
  bodyText2: TextStyle(
    color: Color(0xFF2B2E4A),
    fontWeight: FontWeight.normal,
    fontSize: 10,
  ),
);
