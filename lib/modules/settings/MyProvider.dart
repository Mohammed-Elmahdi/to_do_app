import 'package:flutter/material.dart';
import 'package:to_do_new/shared/styles/my_theme.dart';

class MyProvider extends ChangeNotifier{
  String AppLanguage='en';
  ThemeMode themeMode=ThemeMode.light;

  void changeLanguage(String languageCode){
    AppLanguage=languageCode;
    notifyListeners(); //to rebuild all app
  }

  void changeTheme(ThemeMode theme){
    themeMode=theme;
    notifyListeners();
  }
  Color getBackground() {
    if (themeMode == ThemeMode.light) {
      return MyThemeData.OnprimaryColor;
    } else {
      return MyThemeData.primaryColorDark;
    }
  }
}