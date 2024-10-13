import 'package:flutter/material.dart';
import 'package:trek/utils/constants.dart';
import 'package:trek/utils/styles.dart';
import 'package:trek/view/screens/New_Post_screen/widgets/caption_textfield.dart';
import 'package:trek/view/widgets/main_button.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    // Main Profile Image Container
                    Container(
                      width: screenWidth * 0.65, // Responsive width
                      height: screenWidth * 0.65,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  "assets/christopher-campbell-rDEOVtE7vOs-unsplash.jpg"))),
                      clipBehavior: Clip.antiAlias,
                    ),
                    // Positioned Floating Button slightly outside
                    const Positioned(
                      bottom: -20,
                      child: CircleAvatar(
                        backgroundColor: constants.secodarycolor,
                        radius: 15,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                // Rest of the Form
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      color: constants.fillcolor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "User name",
                            style: styles.mainbuttontext,
                          ),
                          CaptionTextfield(
                              hinttext: "hinttext",
                              keyboard: TextInputType.text,
                              validator: (_) {})
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Full name",
                            style: styles.mainbuttontext,
                          ),
                          CaptionTextfield(
                              hinttext: "hinttext",
                              keyboard: TextInputType.text,
                              validator: (_) {})
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Bio",
                            style: styles.mainbuttontext,
                          ),
                          CaptionTextfield(
                              hinttext: "hinttext",
                              keyboard: TextInputType.text,
                              validator: (_) {})
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Email",
                            style: styles.mainbuttontext,
                          ),
                          CaptionTextfield(
                              hinttext: "hinttext",
                              keyboard: TextInputType.text,
                              validator: (_) {})
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                MainButton(
                  child: const Text(
                    "Done",
                    style: styles.mainbuttontext,
                  ),
                  onpressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
