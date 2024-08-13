import 'dart:async';

import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trek/view/screens/signin/Signin_Screen.dart';
import 'package:trek/controller/authentication_bloc/login_bloc.dart';
import 'package:trek/view/screens/Home_Screen/home_page.dart';
import 'package:trek/utils/constants.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc()..add(CheckLoginStatusEvent()),
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          Timer(const Duration(seconds: 3), () async {
            if (state is authenticated) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const HomeScreen()));
            } else if (state is unauthenticated) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const signinwrapper()));
            } else if (state is AuthenticatedErrorState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            }
          });
        },
        child: FlutterSplashScreen.fadeIn(
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.white,
          childWidget: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .7,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Image.asset("assets/TREk.png"),
            ),
          ),
        ),
      ),
    );
  }
}
