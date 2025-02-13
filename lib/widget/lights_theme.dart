import 'package:flutter/material.dart';

ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
         background: Colors.white,
        primary: Colors.black,
        secondary: Colors.black,
      )
    );
  }