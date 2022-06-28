import 'package:firebase_testv2/constants/constants.dart';
import 'package:flutter/material.dart';

class Themes {
  static ThemeData getDark() {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: 'Roboto',
      buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
        buttonColor: ColorConstants.accentColor,
      ),
      primarySwatch: Colors.orange,
      primaryColor: ColorConstants.accentColor,
      backgroundColor: Colors.black,
      cardColor: const Color(0xFF151515),
      canvasColor: Colors.black,
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
          elevation: 0.0, backgroundColor: ColorConstants.secondaryColor),
      textSelectionTheme: const TextSelectionThemeData(
        selectionColor: Colors.white,
      ),
    );
  }

  static ThemeData getLight() {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: 'Roboto',
      primarySwatch: Colors.red,
      primaryColor: Colors.white,
      backgroundColor: const Color(0xffF1F5FB),
      indicatorColor: const Color(0xffCBDCF8),
      hintColor: const Color(0xffEECED3),
      highlightColor: const Color(0xffFCE192),
      hoverColor: const Color(0xff4285F4),
      focusColor: const Color(0xffA8DAB5),
      disabledColor: Colors.grey,
      cardColor: Colors.white,
      canvasColor: Colors.grey[50],
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        selectionColor: Colors.black,
      ),
    );
  }
}
