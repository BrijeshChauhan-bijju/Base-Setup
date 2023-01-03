import 'package:flutter/material.dart';

class HexColorGenerator {
  static Color? get(String? hexValue) {
    if (hexValue == null || hexValue.isEmpty) {
      return null;
    }

    try {
      hexValue = hexValue.toUpperCase().replaceAll("#", "");
      hexValue = "0xff" + hexValue;

      return Color(int.parse(hexValue));
    } catch (e) {
      return null;
    }
  }
}
