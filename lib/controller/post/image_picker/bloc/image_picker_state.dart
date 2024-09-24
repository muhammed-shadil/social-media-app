part of 'image_picker_bloc.dart';

@immutable
sealed class ImagePickerState {}

final class ImagePickerInitial extends ImagePickerState {}

class SuccessfullyPickedImage extends ImagePickerState {
  final Uint8List imageurl;
  final XFile? file;
  SuccessfullyPickedImage({this.file, required this.imageurl});
}

class FaildPickImage extends ImagePickerState {
  final String message;

  FaildPickImage({required this.message});
}

class LoadingPickImage extends ImagePickerState {}
