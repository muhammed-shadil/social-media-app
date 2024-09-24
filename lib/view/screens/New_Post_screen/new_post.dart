import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trek/controller/post/image_picker/bloc/image_picker_bloc.dart';

class NewPostWrappper extends StatelessWidget {
  const NewPostWrappper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImagePickerBloc(),
      child: const NewPosts(),
    );
  }
}

class NewPosts extends StatelessWidget {
  const NewPosts({super.key});

  @override
  Widget build(BuildContext context) {
    final image = BlocProvider.of<ImagePickerBloc>(context);
    return Scaffold(
      body: Column(
        children: [
          BlocBuilder<ImagePickerBloc, ImagePickerState>(
            builder: (context, state) {
              if (state is SuccessfullyPickedImage) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.7,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: MemoryImage(state.imageurl),
                          fit: BoxFit.cover)),
                );
              }
              return SizedBox(
                width: 200,
                height: 200,
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
                        icon: const Icon(Icons.abc))),
              );
            },
          )
        ],
      ),
    );
  }
}
