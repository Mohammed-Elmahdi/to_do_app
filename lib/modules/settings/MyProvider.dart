import 'package:flutter/material.dart';

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
}