import 'package:flutter/material.dart';

class ColorConstants {
  // static MaterialColor primaryColor = const MaterialColor(#1C1B1F)
  static Color primaryColorDark = Colors.black;
  static Color secondaryColorDark = const Color(0xff272727);
  static Color ternaryColorDark = const Color(0xff979797);
  static Color accentColorDark = const Color.fromRGBO(255, 159, 45, 1);
  static Color primaryColorLight = Colors.white;
  static Color secondaryColorLight = const Color.fromRGBO(238, 232, 244, 1);
  static Color ternaryColorLight = const Color(0xFF79747E);
  static Color accentColorLight = const Color.fromRGBO(103, 80, 164, 1);
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
