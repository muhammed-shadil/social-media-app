
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trek/view/screens/New_Post_screen/image_post_confirmscreen.dart';

class PostButton extends StatelessWidget {
  const PostButton({
    super.key,
    required this.imageurl,
    required this.imagefile,
  });

  final Uint8List? imageurl;
  final XFile? imagefile;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  if (imageurl != null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ImagepostconfirmscreenWrapper(
                                  imagefile: imagefile,
                                  imageurl: imageurl!,
                                )));
                  } else {
                    print(null);
                  }
                  // createpost.add(CreateNewPost(imagefile: imagefile));
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
        ));
  }
}
