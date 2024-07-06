import 'package:flutter/material.dart';
import 'package:trek/main_button.dart';
import 'package:trek/main_textfield.dart';
import 'package:trek/signup_screen.dart';
import 'package:trek/utils/constants.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
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
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 50),
                    child: Text(
                      "Sign in",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: MainTextfield(
                      preicon: Icons.email_outlined,
                      hinttext: "Please enter your email",
                      namefield: "Email",
                      controller: emailcontroller,
                      keyboard: TextInputType.emailAddress,
                      validator: (value) {},
                    ),
                  ),
                  MainTextfield(
                    preicon: Icons.lock,
                    hinttext: "Please enter your password",
                    namefield: "Password",
                    keyboard: TextInputType.visiblePassword,
                    validator: (value) {},
                    controller: passwordcontroller,
                  ),
                  constants.height30,
                  MainButton(
                    buttontext: "Sign in",
                    onpressed: () {},
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      "or continue with",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        color: constants.fillcolor,
                        borderRadius: BorderRadius.circular(10)),
                    width: 40,
                    height: 40,
                    child: const Icon(
                      Icons.g_mobiledata,
                      size: 40,
                      color: constants.secodarycolor,
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't you have an account? ",
                          style: TextStyle(),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => SignupScreen()));
                          },
                          child: const Text(
                            "Sign up",
                            style: TextStyle(color: constants.secodarycolor),
                          ),
                        )
                      ],
                    ),
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
