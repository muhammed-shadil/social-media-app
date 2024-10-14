// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trek/controller/post/newpost/bloc/newpost_bloc.dart';
import 'package:trek/utils/constants.dart';
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
        imagefile: imagefile,
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
    print(imagefile);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Post"),
            automaticallyImplyLeading: false,
            centerTitle: true,
          ),
          body: BlocListener<NewpostBloc, NewpostState>(
            listener: (context, state) {
              if (state is SuccessfullyCreatePost) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.message)));
                Navigator.pop(context);
              } else if (state is FaildCreatePost) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: SingleChildScrollView(
                child: Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 20),
                                clipBehavior: Clip.antiAlias,
                                width: MediaQuery.of(context).size.width * 0.3,
                                height:
                                    MediaQuery.of(context).size.height * 0.25,
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
                                validator: (value) {
                                  List<String> words =
                                      value.trim().split(RegExp(r'\s+'));
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
                          MainButton(
                            onpressed: () {
                              print("$imagefile ii");
                              if (formKey.currentState!.validate()) {
                                print("$imagefile gg");
                                createpost.add(CreateNewPost(
                                    imagefile: imagefile,
                                    postType: 'Image',
                                    caption: captioncontroller.text));
                              }
                            },
                            child: BlocBuilder<NewpostBloc, NewpostState>(
                              builder: (context, state) {
                                if (state is LoadingCreatePost) {
                                  return const SizedBox(
                                    width: 16,
                                    height: 16,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 1.5,
                                      color: constants.white,
                                    ),
                                  );
                                }
                                return const Text(
                                  "Post",
                                  style: styles.mainbuttontext,
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
