
import 'package:flutter/material.dart';
import 'package:hng12country/widget/dark_theme.dart';
import 'package:hng12country/widget/lights_theme.dart';

class Themeprovider with ChangeNotifier{
  ThemeData _themeData =lightTheme;
  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData){
    _themeData =themeData;
    notifyListeners();
  }

  void toggleTheme(){
    if (_themeData == lightTheme){
      themeData =darkTheme;
    }else{
      themeData = lightTheme;
    }
  }
}