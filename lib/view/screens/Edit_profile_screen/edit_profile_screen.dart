import 'package:flutter/material.dart';
import 'package:trek/utils/constants.dart';
import 'package:trek/utils/styles.dart';
import 'package:trek/view/widgets/main_button.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                                "assets/christopher-campbell-rDEOVtE7vOs-unsplash.jpg"))),
                    clipBehavior: Clip.antiAlias,
                  ),
                  const Align(
                      alignment: Alignment.bottomCenter,
                      child: CircleAvatar(
                        backgroundColor: constants.secodarycolor,
                        child: Icon(
                          Icons.add,
                          color: constants.white,
                        ),
                      ))
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                decoration: BoxDecoration(
                    color: constants.fillcolor,
                    borderRadius: BorderRadius.circular(15)),
                height: 230,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "User name",
                          style: styles.mainbuttontext,
                        ),
                        Text("rocks_se")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Full name",
                          style: styles.mainbuttontext,
                        ),
                        Text("arya stark")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Bio",
                          style: styles.mainbuttontext,
                        ),
                        Text("sweetest dream girl :)")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Email",
                          style: styles.mainbuttontext,
                        ),
                        Text("aryastarkmaoj@gmail.com")
                      ],
                    )
                  ],
                ),
              ),
              MainButton(
                child: const Text(
                  "Done",
                  style: styles.mainbuttontext,
                ),
                onpressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
