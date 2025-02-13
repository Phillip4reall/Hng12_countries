import 'package:flutter/material.dart';

ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        background: Colors.grey.shade900,
        primary: Colors.white,
        secondary: Colors.white,
      ),  
    );
  }
