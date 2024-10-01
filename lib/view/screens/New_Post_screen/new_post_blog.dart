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
            MainTextfield(
                maxlines: 1,
                preicon: Icons.format_quote_outlined,
                hinttext: "Enter you words",
                namefield: "Title",
                keyboard: TextInputType.multiline,
                validator: (_) {}),
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
