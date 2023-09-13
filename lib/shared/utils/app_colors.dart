import 'package:flutter/material.dart';

class AppColors {
  static const primary = Colors.red;
  static const secondary = Color.fromARGB(255, 0, 0, 0);
  static const tertiary = Color.fromARGB(255, 112, 112, 112);
  static const primaryClair = Color.fromARGB(255, 247, 213, 213);
  static const white = Colors.white;

  static const Color errorColor = Color(0xffED1A34);
  static const Color warningColor = Color(0xffff9900);
  static const Color successColor = Color(0xff65C145);

  static const Color primaryText = Color.fromARGB(255, 126, 126, 126);
  static const Color grayScale = Color(0xFF9099A6);
  static const Color primaryGrayText = Color.fromRGBO(51, 51, 51, 1);

  static hexToColor(String hexString) {
    var hexColor = hexString.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }

  static const defaultPadding = 16.0;
}
