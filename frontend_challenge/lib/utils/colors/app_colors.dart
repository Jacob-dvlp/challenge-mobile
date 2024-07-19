import 'package:flutter/material.dart';

class AppColors {
  static Color introColorBackGround = const Color(0XFF18191B);
  static Color colorWhite = const Color(0xFFFFFFFF);
  static Color colorRed = const Color(0xFFF44336);
  static ThemeData themeData = ThemeData(
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: colorRed,
    ),
    scaffoldBackgroundColor: introColorBackGround,
    scrollbarTheme: const ScrollbarThemeData(),
    textTheme: TextTheme(
        bodyMedium: const TextStyle(color: Colors.white, fontSize: 15),
        titleMedium: TextStyle(color: colorWhite),
        titleLarge: TextStyle(
          color: colorWhite,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        )),
    appBarTheme: AppBarTheme(color: introColorBackGround),
    iconTheme: IconThemeData(
      color: colorRed,
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: WidgetStatePropertyAll(colorRed),
      ),
    ),
  );
}
