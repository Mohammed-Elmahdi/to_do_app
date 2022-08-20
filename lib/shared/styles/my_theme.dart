import 'package:flutter/material.dart';

class MyThemeData {
  static Color primaryColor = Color(0xFF5D9CEC);
  static Color OnprimaryColor = Color(0xFFDFECDB);

// static Color primaryColorDark = Color(0xFF12182A);
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
        fontSize: 30,
        color: WhiteColor,
        fontWeight: FontWeight.w700,
      ),
      headline2: TextStyle(
        fontSize: 25,
        color: primaryColor,
        fontWeight: FontWeight.w400,
      ),
      headline3: TextStyle(
        fontSize: 25,
        color: WhiteColor,
        fontWeight: FontWeight.w400,
      ),
      subtitle1: TextStyle(
        fontSize: 25,
        color: BlackColor,
        fontWeight: FontWeight.w500,
      ),
      bodyText1: TextStyle(
        fontSize: 20,
        color: BlackColor,
        fontWeight: FontWeight.w400,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: primaryColor, unselectedItemColor: Colors.grey),
    floatingActionButtonTheme:
    FloatingActionButtonThemeData(backgroundColor: primaryColor),
  );

// static final ThemeData darkTheme = ThemeData(
//     primaryColor: primaryColorDark,
//     appBarTheme: AppBarTheme(
//         centerTitle: true,
//         color: Colors.transparent,
//         elevation: 0,
//         iconTheme: IconThemeData(color: WhiteColor)),
//     textTheme: TextTheme(
//       headline1: TextStyle(
//         fontSize: 30,
//         color: WhiteColor,
//         fontWeight: FontWeight.w700,
//       ),
//       headline2: TextStyle(
//         fontSize: 25,
//         color: YellowColor,
//         fontWeight: FontWeight.w400,
//       ),
//       subtitle1: TextStyle(
//         fontSize: 25,
//         color: YellowColor,
//         fontWeight: FontWeight.w500,
//       ),
//       bodyText1: TextStyle(
//         fontSize: 20,
//         color: YellowColor,
//         fontWeight: FontWeight.w500,
//       ),
//     ),
//     bottomNavigationBarTheme: BottomNavigationBarThemeData(
//         selectedItemColor: YellowColor, unselectedItemColor: Colors.white));
}
