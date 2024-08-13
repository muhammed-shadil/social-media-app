import 'package:flutter/material.dart';
import 'package:trek/view/screens/splash_screen.dart';
import 'package:trek/utils/constants.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        listTileTheme: const ListTileThemeData(textColor: Colors.white),
        appBarTheme: const AppBarTheme(
            color: constants.backgroundColor, foregroundColor: constants.white),
        scaffoldBackgroundColor: constants.backgroundColor,
        textTheme: const TextTheme(
          titleMedium: TextStyle(color: constants.white),
          bodyMedium: TextStyle(color: constants.white),
        )),
    home: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}
