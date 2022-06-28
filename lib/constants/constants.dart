import 'package:flutter/material.dart';

class ColorConstants {
  // static MaterialColor primaryColor = const MaterialColor(#1C1B1F)
  static Color primaryColor = Colors.black;
  static Color secondaryColor = const Color(0xff272727);
  static Color ternaryColor = const Color(0xff979797);
  static Color accentColor = const Color.fromRGBO(255, 159, 45, 1);
}

class CardConstants {
  static TextStyle titleStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: Color(0xFF1A2E35),
  );

  static TextStyle subTitleStyle =
      const TextStyle(fontSize: 17, fontWeight: FontWeight.w500);
}
