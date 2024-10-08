import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trek/utils/constants.dart';
import 'package:trek/utils/styles.dart';
import 'package:trek/view/widgets/main_button.dart';
import 'package:trek/view/widgets/main_textfield.dart';

class NewPostBlog extends StatelessWidget {
  const NewPostBlog({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // floatingActionButton: Container(
        //     width: 80,
        //     height: 80,
        //     decoration: const BoxDecoration(
        //       shape: BoxShape.circle,
        //       color: Color.fromARGB(255, 45, 46, 52),
        //     ),
        //     child: Center(
        //       child: Container(
        //         width: 70,
        //         height: 70,
        //         decoration: const BoxDecoration(
        //           shape: BoxShape.circle,
        //           color: Color.fromARGB(255, 83, 84, 89),
        //         ),
        //         child: Center(
        //           child: GestureDetector(
        //             onTap: () {},
        //             child: Container(
        //               width: 52,
        //               height: 52,
        //               decoration: const BoxDecoration(
        //                 shape: BoxShape.circle,
        //                 color: constants.white,
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        //     )),
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.95,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.close_outlined,
                              size: 30,
                            ),
                            color: constants.white,
                          ),
                          const Text(
                            "Quote your words",
                            style: styles.imagepickertitle,
                          ),
                          const SizedBox(),
                        ],
                      ),
                    ),
                    constants.height30,
                    MainTextfield(
                      space: true,
                      maxlines: 1,
                      preicon: Icons.library_books_outlined,
                      hinttext: "Enter you words",
                      namefield: "Title",
                      keyboard: TextInputType.multiline,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field cannot be empty';
                        } else if (value.length < 3) {
                          return 'Enter at least 3 letters';
                        }
                        return null;
                      },
                    ),
                    constants.height20,
                    MainTextfield(
                      space: true,
                      maxlines: 5,
                      hinttext: "Explain you words",
                      namefield: "Content",
                      keyboard: TextInputType.multiline,
                      validator: (value) {
                        List<String> words = value.trim().split(RegExp(r'\s+'));
                        if (value == null || value.isEmpty) {
                          return 'This field cannot be empty';
                        } else if (words.length < 2) {
                          return 'Please enter at least two words';
                        }

                        return null;
                      },
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: MainButton(
                    onpressed: () {},
                    child: const Text(
                      "Post",
                      style: styles.mainbuttontext,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
