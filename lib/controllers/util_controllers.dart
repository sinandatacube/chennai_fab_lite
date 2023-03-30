import 'package:flutter/material.dart';

class UtilControllers {
  Color mainColor = const Color(0xFF1F8996);
  Color secondaryColor = const Color(0xFFE5D227);

  static const MaterialColor mainColors = MaterialColor(
    _tealPrimaryValue,
    <int, Color>{
      50: Color(0xFFE0F2F1),
      100: Color(0xFFB2DFDB),
      200: Color(0xFF80CBC4),
      300: Color(0xFF4DB6AC),
      400: Color(0xFF26A69A),
      500: Color(_tealPrimaryValue),
      600: Color(0xFF00897B),
      700: Color(0xFF00796B),
      800: Color(0xFF00695C),
      900: Color(0xFF004D40),
    },
  );
  static const int _tealPrimaryValue = 0xFF1F8996;
}
