part of 'image_picker_bloc.dart';

@immutable
sealed class ImagePickerEvent {}

class CameraImagePicker extends ImagePickerEvent {}

class GalleryImagePicker extends ImagePickerEvent {}
