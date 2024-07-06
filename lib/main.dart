import 'package:flutter/material.dart';
import 'package:trek/Signin_Screen.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false,
    theme: ThemeData(appBarTheme:   const AppBarTheme(color:  Color.fromARGB(255, 26, 27, 34),foregroundColor: Colors.white),
      scaffoldBackgroundColor: const Color.fromARGB(255, 26, 27, 34),
        primaryColor: const Color.fromARGB(255, 26, 27, 34),
        textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Colors.white)) // Background color
        // You can customize more properties here
        ),
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const SigninScreen();
  }
}
