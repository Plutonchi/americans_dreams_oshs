import 'package:flutter/material.dart';

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: ColorScheme.dark(),
    accentColor: Colors.pink,
    brightness: Brightness.light,
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    accentColor: Colors.red,
    brightness: Brightness.dark,
    primaryColor: Colors.amber,
    colorScheme: ColorScheme.light(),
  );
}
