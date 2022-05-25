import 'package:flutter/material.dart';

const primarycolor = Color(0xFF6061FA);
const backgroundcolor = Color(0xFFFFFF);
const errorcolor = Color(0xFFFE5350);

class Config {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = MediaQueryData!.size.width;
    screenHeight = MediaQueryData!.size.height;
    orientation = _mediaQueryData!.orientation;
  }
}
