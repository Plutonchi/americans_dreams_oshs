import 'package:american_dream_osh/presentasion/page/home_page.dart';
import 'package:american_dream_osh/presentasion/page/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // themeMode: ThemeMode.system,
      // theme: MyThemes.lightTheme,
      // darkTheme: MyThemes.darkTheme,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
