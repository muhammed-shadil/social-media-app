import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trek/utils/constants.dart';
import 'package:trek/utils/styles.dart';
import 'package:trek/view/widgets/main_textfield.dart';

class NewPostBlog extends StatelessWidget {
  const NewPostBlog({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(255, 45, 46, 52),
            ),
            child: Center(
              child: Container(
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 83, 84, 89),
                ),
                child: Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 52,
                      height: 52,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: constants.white,
                      ),
                    ),
                  ),
                ),
              ),
            )),
        body: Column(
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
                maxlines: 1,
                preicon: Icons.library_books_outlined,
                hinttext: "Enter you words",
                namefield: "Title",
                keyboard: TextInputType.multiline,
                validator: (_) {}),
            constants.height20,
            MainTextfield(
                maxlines: 5,
                hinttext: "Explain you words",
                namefield: "Content",
                keyboard: TextInputType.multiline,
                validator: (_) {})
          ],
        ),
      ),
    );
  }
}
