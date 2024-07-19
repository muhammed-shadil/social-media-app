import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trek/Signin_Screen.dart';
import 'package:trek/bloc/bloc/login_bloc.dart';
import 'package:trek/home_page.dart';
import 'package:trek/main_button.dart';
import 'package:trek/main_textfield.dart';
import 'package:trek/model/usermodel.dart';
import 'package:trek/utils/constants.dart';

class Signupwrapper extends StatelessWidget {
  const Signupwrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: SignupScreen(),
    );
  }
}

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController fullnamecontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is loadingstate) {
              const CircularProgressIndicator();
            } else if (state is Signuperror) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            } else if (state is Signupsuccess) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));

              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const signinwrapper()));
            }
          },
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
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
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: MainTextfield(
                        controller: emailcontroller,
                        preicon: Icons.email_outlined,
                        hinttext: "Please enter your email",
                        namefield: "Email",
                        keyboard: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter a valid email";
                          } else if (!constants.regemail.hasMatch(value)) {
                            return "Please enter a valid email";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    MainTextfield(
                      controller: passwordcontroller,
                      preicon: Icons.lock,
                      hinttext: "Please enter your password",
                      namefield: "Password",
                      keyboard: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a password";
                        } else if (!constants.password.hasMatch(value)) {
                          return 'Password should contain at least one upper case, one lower case, one digit, one special character and  must be 8 characters in length';
                        } else {
                          return null;
                        }
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: MainTextfield(
                        controller: fullnamecontroller,
                        preicon: Icons.person_3_outlined,
                        hinttext: "Please enter your full name",
                        namefield: "Full name",
                        keyboard: TextInputType.name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter name";
                          } else if (!constants.name.hasMatch(value)) {
                            return "Enter a valid name";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: MainTextfield(
                        controller: usernamecontroller,
                        preicon: Icons.person_search_sharp,
                        hinttext: "Please enter your User name",
                        namefield: "User name",
                        keyboard: TextInputType.name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter name";
                          } else if (!constants.name.hasMatch(value)) {
                            return "Enter a valid name";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MainButton(
                        buttontext: "Sign in",
                        onpressed: () {
                          if (formKey.currentState!.validate()) {
                            final users = Usermodel(
                                email: emailcontroller.text,
                                password: passwordcontroller.text,
                                username: usernamecontroller.text);
                            BlocProvider.of<LoginBloc>(context)
                                .add(Signupevent(user: users));
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
