import 'package:flutter/material.dart';

class MyThemeData {
  static Color primaryColor = Color(0xFF5D9CEC);
  static Color OnprimaryColor = Color(0xFFDFECDB);

static Color primaryColorDark = Color(0xFF060E1E);
  static Color BlackColor = Color(0xFF242424);

  static Color WhiteColor = Color(0xFFFFFFFF);
  static Color GreenColor = Color(0xFF61E757);
  static Color RedColor = Color(0xFFEC4B4B);

  // static Color RedColor = Color(0xFFEC4B4B);
  // static Color RedColor = Color(0xFFEC4B4B);

  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: OnprimaryColor,
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: primaryColor,
        elevation: 0,
        iconTheme: IconThemeData(color: WhiteColor)),
    // colorScheme: ColorScheme(
    //   primary: primaryColor,
    //   onPrimary: Colors.white,
    //   secondary: GreenColor,
    //   onSecondary: Colors.white,
    //   error: Colors.red,
    //   onError: Colors.white,
    //   onSurface: Colors.grey,
    //   surface: Colors.white,
    //   onBackground: Colors.white,
    //   brightness: Brightness.light,
    //   background: OnprimaryColor,
    // ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 22,
        color: WhiteColor,
        fontWeight: FontWeight.w700,
      ),
      headline2: TextStyle(
        fontSize: 18,
        color: primaryColor,
        fontWeight: FontWeight.w600,
      ),
      headline3: TextStyle(
        fontSize: 18,
        color: BlackColor,
        fontWeight: FontWeight.w600,
      ),
      subtitle1: TextStyle(
        fontSize: 15,
        color: BlackColor,
        fontWeight: FontWeight.w600,
      ),
      subtitle2: TextStyle(
        fontSize: 14,
        color: BlackColor,
        fontWeight: FontWeight.w600,
      ),
      bodyText1: TextStyle(
        fontSize: 14,
        color: BlackColor,
        fontWeight: FontWeight.w400,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: primaryColor, unselectedItemColor: Colors.grey),
    floatingActionButtonTheme:
    FloatingActionButtonThemeData(backgroundColor: primaryColor),
  );

static final ThemeData darkTheme = ThemeData(
    primaryColor: primaryColorDark,
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: WhiteColor)),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 22,
        color: BlackColor,
        fontWeight: FontWeight.w700,
      ),
     headline2: TextStyle(
        fontSize: 18,
        color: primaryColor,
        fontWeight: FontWeight.w600,
      ),
      headline3: TextStyle(
        fontSize: 18,
        color: BlackColor,
        fontWeight: FontWeight.w600,
      ),
      subtitle1: TextStyle(
        fontSize: 15,
        color: WhiteColor,
        fontWeight: FontWeight.w600,
      ),
      subtitle2: TextStyle(
        fontSize: 14,
        color: WhiteColor,
        fontWeight: FontWeight.w600,
      ),
      bodyText1: TextStyle(
        fontSize: 14,
        color: WhiteColor,
        fontWeight: FontWeight.w400,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: primaryColor, unselectedItemColor: Colors.white));
}
