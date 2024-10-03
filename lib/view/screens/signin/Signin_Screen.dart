import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trek/controller/authentication_bloc/login_bloc.dart';
import 'package:trek/utils/styles.dart';
import 'package:trek/view/screens/Home_Screen/home_page.dart';
import 'package:trek/view/widgets/main_button.dart';
import 'package:trek/view/widgets/main_textfield.dart';
import 'package:trek/view/screens/signup/signup_screen.dart';
import 'package:trek/utils/constants.dart';

class Signinwrapper extends StatelessWidget {
  const Signinwrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: SigninScreen(),
    );
  }
}

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is loadingstate) {
              const Center(
                  child: CircularProgressIndicator(
                color: constants.white,
              ));
            } else if (state is loginerror) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            } else if (state is loginsuccess) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));

              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const HomeScreenWrapper()));
            }
          },
          child: Center(
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.95,
                child: Form(
                  key: formKey,
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
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: MainTextfield(
                          preicon: Icons.email_outlined,
                          hinttext: "Please enter your email",
                          namefield: "Email",
                          controller: emailcontroller,
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
                        controller: passwordcontroller,
                      ),
                      constants.height30,
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          if (state is loadingstate) {
                            return MainButton(
                                onpressed: () {},
                                child: const Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Signing in",
                                      style: styles.textfieldhintstyle,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    SizedBox(
                                        width: 15,
                                        height: 15,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 1,
                                          color: constants.white,
                                        )),
                                  ],
                                ));
                          }
                          return MainButton(
                            child: const Text("Sign in",
                                style: styles.mainbuttontext),
                            onpressed: () {
                              if (formKey.currentState!.validate()) {
                                BlocProvider.of<LoginBloc>(context).add(
                                    Loginevent(emailcontroller.text,
                                        passwordcontroller.text));
                              }
                            },
                          );
                        },
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
                      Row(
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
                                      builder: (_) => Signupwrapper()));
                            },
                            child: const Text(
                              "Sign up",
                              style: TextStyle(color: constants.secodarycolor),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
// shihas732@gmail.com
// shihas123