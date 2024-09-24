part of 'newpost_bloc.dart';

@immutable
sealed class NewpostEvent {}

class CreateNewPost extends NewpostEvent {
  final XFile? imagefile;

  CreateNewPost({required this.imagefile});
}
