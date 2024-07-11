import 'package:flutter/material.dart';
import 'package:trek/Signin_Screen.dart';
import 'package:trek/utils/constants.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        appBarTheme: const AppBarTheme(
            color: constants.backgroundColor, foregroundColor: constants.white),
        scaffoldBackgroundColor: constants.backgroundColor,
        textTheme:
            const TextTheme(bodyMedium: TextStyle(color: constants.white))),
    home: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  signinwrapper();
  }
}
