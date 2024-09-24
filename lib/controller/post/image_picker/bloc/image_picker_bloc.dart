import 'dart:async';
import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
part 'image_picker_event.dart';
part 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  ImagePickerBloc() : super(ImagePickerInitial()) {
    on<CameraImagePicker>(camerImagepickerBloc);
    on<GalleryImagePicker>(galleryImagepickerBloc);
  }

  FutureOr<void> camerImagepickerBloc(
      CameraImagePicker event, Emitter<ImagePickerState> emit) async {
    emit(LoadingPickImage());
    try {
      final ImagePicker imagePicker = ImagePicker();
      XFile? res = await imagePicker.pickImage(source: ImageSource.camera);

      if (res != null) {
        final memoryImg = await res.readAsBytes();
        emit(SuccessfullyPickedImage(imageurl: memoryImg, file: res));
      } else {
        emit(FaildPickImage(message: 'Image not picked'));
      }
    } catch (e) {
      emit(FaildPickImage(message: e.toString()));
    }
  }

  FutureOr<void> galleryImagepickerBloc(
      GalleryImagePicker event, Emitter<ImagePickerState> emit) async {
    emit(LoadingPickImage());
    try {
      final ImagePicker imagePicker = ImagePicker();
      XFile? res = await imagePicker.pickImage(source: ImageSource.gallery);

      if (res != null) {
        final memoryImg = await res.readAsBytes();
        emit(SuccessfullyPickedImage(imageurl: memoryImg, file: res));
      } else {
        emit(FaildPickImage(message: 'Image not picked'));
      }
    } catch (e) {
      emit(FaildPickImage(message: e.toString()));
    }
  }
}
