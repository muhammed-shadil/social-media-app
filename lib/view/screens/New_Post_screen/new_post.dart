import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trek/controller/post/image_picker/bloc/image_picker_bloc.dart';
import 'package:trek/controller/post/newpost/bloc/newpost_bloc.dart';
import 'package:trek/utils/constants.dart';
import 'package:trek/utils/styles.dart';

class NewPostWrappper extends StatelessWidget {
  const NewPostWrappper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ImagePickerBloc(),
        ),
        BlocProvider(
          create: (context) => NewpostBloc(),
        ),
      ],
      child: const NewPosts(),
    );
  }
}

class NewPosts extends StatefulWidget {
  const NewPosts({super.key});

  @override
  State<NewPosts> createState() => _NewPostsState();
}

class _NewPostsState extends State<NewPosts> {
  XFile? imagefile;
  @override
  Widget build(BuildContext context) {
    final image = BlocProvider.of<ImagePickerBloc>(context);
    final createpost = BlocProvider.of<NewpostBloc>(context);

    return Scaffold(
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
                  onTap: () {
                    createpost.add(CreateNewPost(imagefile: imagefile));
                  },
                  child: Container(
                    width: 52,
                    height: 52,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          )),

      //  FloatingActionButton( onPressed: () {
      //   createpost.add(CreateNewPost(imagefile: imagefile));
      // },),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.close_outlined,
                      size: 30,
                    ),
                    color: constants.white,
                  ),
                  const Text(
                    "Click your dream place",
                    style: styles.imagepickertitle,
                  ),
                  SizedBox(),
                ],
              ),
            ),
            BlocBuilder<ImagePickerBloc, ImagePickerState>(
              builder: (context, state) {
                if (state is SuccessfullyPickedImage) {
                  imagefile = state.file;
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.94,
                    height: MediaQuery.of(context).size.height * 0.73,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        image: DecorationImage(
                            image: MemoryImage(state.imageurl),
                            fit: BoxFit.cover)),
                  );
                }
                return Container(
                  width: MediaQuery.of(context).size.width * 0.94,
                  height: MediaQuery.of(context).size.height * 0.73,
                  decoration: BoxDecoration(
                    color: constants.fillcolor,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Center(
                      child: IconButton(
                          onPressed: () async {
                            showCupertinoModalPopup(
                              context: context,
                              builder: (context) => CupertinoActionSheet(
                                actions: [
                                  CupertinoActionSheetAction(
                                    child: const Text('Photo Gallery'),
                                    onPressed: () {
                                      // close the options modal
                                      Navigator.of(context).pop();
                                      // get image from gallery
                                      image.add(GalleryImagePicker());
                                    },
                                  ),
                                  CupertinoActionSheetAction(
                                    child: Text('Camera'),
                                    onPressed: () {
                                      // close the options modal
                                      Navigator.of(context).pop();
                                      // get image from camera
                                      image.add(CameraImagePicker());
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.add,
                            color: constants.offwhite,
                            size: 50,
                          ))),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
