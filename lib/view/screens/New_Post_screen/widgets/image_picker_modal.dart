
import 'package:flutter/cupertino.dart';
import 'package:trek/controller/post/image_picker/bloc/image_picker_bloc.dart';

class ImagePickerModal extends StatelessWidget {
  const ImagePickerModal({
    super.key,
    required this.image,
  });

  final ImagePickerBloc image;

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
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
          child: const Text('Camera'),
          onPressed: () {
            // close the options modal
            Navigator.of(context).pop();
            // get image from camera
            image.add(CameraImagePicker());
          },
        ),
      ],
    );
  }
}
