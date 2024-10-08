import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:trek/utils/styles.dart';
import 'package:trek/view/screens/New_Post_screen/widgets/caption_textfield.dart';
import 'package:trek/view/widgets/main_button.dart';
import 'package:trek/view/widgets/main_textfield.dart';
import 'package:trek/view/widgets/search_textfield.dart';

class ImagePostConfirmscreen extends StatelessWidget {
  const ImagePostConfirmscreen({super.key, required this.imageurl});
  final Uint8List imageurl;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Post"),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: SingleChildScrollView(
            child: Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          clipBehavior: Clip.antiAlias,
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.height * 0.25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)),
                          child: Image(
                            fit: BoxFit.cover,
                            image: MemoryImage(imageurl),
                          ),
                        ),
                        MainTextfield(
                            space: true,
                            maxlines: 5,
                            hinttext: "Explain you words",
                            namefield: "Caption",
                            keyboard: TextInputType.multiline,
                            validator: (_) {})

                        // CaptionTextfield(
                        //     hinttext: "caption",
                        //     keyboard: TextInputType.text,
                        //     validator: (_) {})
                      ],
                    ),
                    MainButton(
                      onpressed: () {},
                      child: const Text(
                        "Post",
                        style: styles.mainbuttontext,
                      ),
                    )
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
