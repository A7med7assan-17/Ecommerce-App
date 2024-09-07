import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(
  floatingActionButtonTheme:
      FloatingActionButtonThemeData(backgroundColor: AppColor.primaryColor),
  scaffoldBackgroundColor: Colors.white,
  fontFamily: 'Poppins',
  appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white),
  colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
  useMaterial3: true,
);
ThemeData themeArabic = ThemeData(
  floatingActionButtonTheme:
      FloatingActionButtonThemeData(backgroundColor: AppColor.primaryColor),
  scaffoldBackgroundColor: Colors.white,
  fontFamily: 'NotoSansArabic',
  appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white),
  colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
  useMaterial3: true,
);

class AppColor {
  static const Color primaryColor = Color(0xFFED7A07);
  static const Color secondColor = Color.fromARGB(255, 249, 222, 195);
  static const Color greyColor = Color(0xFF6a6a6a);
}
