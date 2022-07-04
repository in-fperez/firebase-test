import 'package:firebase_testv2/constants/constants.dart';
import 'package:flutter/material.dart';

class Themes {
  static ThemeData getDark() {
    return ThemeData(
      useMaterial3: true,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: 'Roboto',
      textTheme: sharedTextTheme,
      colorScheme: ColorScheme(
          primary: ColorConstants.primaryColorDark,
          onPrimary: ColorConstants.primaryColorDark,
          secondary: ColorConstants.secondaryColorDark,
          onSecondary: ColorConstants.secondaryColorDark,
          error: ColorConstants.accentColorDark,
          onError: ColorConstants.accentColorDark,
          brightness: Brightness.dark,
          background: ColorConstants.primaryColorDark,
          onBackground: ColorConstants.primaryColorDark,
          surface: ColorConstants.secondaryColorDark,
          onSurface: ColorConstants.secondaryColorDark),
      primarySwatch: Colors.grey,
      primaryColor: ColorConstants.primaryColorDark,
      backgroundColor: Colors.black,
      canvasColor: Colors.black,
      brightness: Brightness.dark,
      appBarTheme:
          AppBarTheme(backgroundColor: ColorConstants.secondaryColorDark),
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
      primaryColor: ColorConstants.primaryColorLight,
      colorScheme: ColorScheme(
          primary: ColorConstants.primaryColorLight,
          onPrimary: ColorConstants.primaryColorLight,
          secondary: ColorConstants.secondaryColorLight,
          onSecondary: ColorConstants.secondaryColorLight,
          error: ColorConstants.accentColorLight,
          onError: ColorConstants.accentColorLight,
          brightness: Brightness.light,
          background: ColorConstants.primaryColorLight,
          onBackground: ColorConstants.primaryColorLight,
          surface: ColorConstants.secondaryColorLight,
          onSurface: ColorConstants.secondaryColorLight),
      backgroundColor: ColorConstants.secondaryColorLight,
      indicatorColor: const Color(0xffCBDCF8),
      hintColor: const Color(0xffEECED3),
      canvasColor: const Color(0xffF1F5FB),
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(
          backgroundColor: ColorConstants.secondaryColorLight,
          titleTextStyle: sharedTextTheme.headline3),
    );
  }
}

TextTheme sharedTextTheme = const TextTheme(
  headline1: TextStyle(
    color: Color(0xFF2B2E4A),
    fontWeight: FontWeight.w600,
    fontSize: 34,
  ),
  headline2: TextStyle(
      color: Color(0xFF2B2E4A),
      fontWeight: FontWeight.w400,
      fontSize: 22,
      height: 28),
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
