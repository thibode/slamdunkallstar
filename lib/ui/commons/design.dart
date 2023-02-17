import 'package:flutter/material.dart';

class AppColors {
  static const MaterialColor primaryMatColor = Colors.brown;
  static const Color primaryColor = Color(0xFFffd60a);
  static const Color secondaryColor = Color(0xFFffc300);
  static const Color thirdColor = Color(0xFF003566);
  static const Color darkblue = Color(0xFF001d3d);
  static const Color darkGrey = Color.fromARGB(58, 158, 158, 158);
  static const Color black = Colors.black;
}

class AppStyle {
  static const OutlineInputBorder borderRad16 =
      OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(16)));
  static const TextStyle f24 = TextStyle(
      fontSize: 24, color: AppColors.darkblue, fontWeight: FontWeight.w700);
  static Decoration yellowBox = BoxDecoration(
      borderRadius: BorderRadius.circular(30.0), color: AppColors.thirdColor);
}
