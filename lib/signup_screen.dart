import 'package:flutter/material.dart';
import 'package:trek/main_button.dart';
import 'package:trek/main_textfield.dart';
import 'package:trek/utils/constants.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController fullnamecontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 14),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: constants.white,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text(
                      "Sign up",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: MainTextfield(
                      controller: emailcontroller,
                      preicon: Icons.email_outlined,
                      hinttext: "Please enter your email",
                      namefield: "Email",
                      keyboard: TextInputType.emailAddress,
                      validator: (value) {},
                    ),
                  ),
                  MainTextfield(
                    controller: passwordcontroller,
                    preicon: Icons.lock,
                    hinttext: "Please enter your password",
                    namefield: "Password",
                    keyboard: TextInputType.visiblePassword,
                    validator: (value) {},
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: MainTextfield(
                      controller: fullnamecontroller,
                      preicon: Icons.person_3_outlined,
                      hinttext: "Please enter your full name",
                      namefield: "Full name",
                      keyboard: TextInputType.name,
                      validator: (value) {},
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 40),
                    child: MainTextfield(
                      controller: usernamecontroller,
                      preicon: Icons.person_search_sharp,
                      hinttext: "Please enter your User name",
                      namefield: "User name",
                      keyboard: TextInputType.name,
                      validator: (value) {},
                    ),
                  ),
                  MainButton(
                    buttontext: "Sign in",
                    onpressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
