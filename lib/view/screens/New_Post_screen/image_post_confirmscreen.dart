// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trek/controller/post/newpost/bloc/newpost_bloc.dart';
import 'package:trek/utils/styles.dart';
import 'package:trek/view/widgets/main_button.dart';
import 'package:trek/view/widgets/main_textfield.dart';

class ImagepostconfirmscreenWrapper extends StatelessWidget {
  const ImagepostconfirmscreenWrapper({
    super.key,
    required this.imageurl,
    this.imagefile,
  });
  final Uint8List imageurl;
  final XFile? imagefile;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewpostBloc(),
      child: ImagePostConfirmscreen(
        imageurl: imageurl,
      ),
    );
  }
}

class ImagePostConfirmscreen extends StatelessWidget {
  ImagePostConfirmscreen({
    super.key,
    required this.imageurl,
    this.imagefile,
  });

  final Uint8List imageurl;
  final XFile? imagefile;

  TextEditingController captioncontroller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final createpost = BlocProvider.of<NewpostBloc>(context);

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
                            controller: captioncontroller,
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
                      onpressed: () {
                        if (formKey.currentState!.validate()) {
                          createpost.add(CreateNewPost(
                              imagefile: imagefile,
                              postType: 'Image',
                              caption: captioncontroller.text));
                        }
                      },
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
