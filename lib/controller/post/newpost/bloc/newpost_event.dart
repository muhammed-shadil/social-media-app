part of 'newpost_bloc.dart';

@immutable
sealed class NewpostEvent {}

class CreateNewPost extends NewpostEvent {
  final XFile? imagefile;
  final String postType;
  final String caption;
  final String? blogContent;

  CreateNewPost(
      {this.imagefile,
      required this.postType,
      required this.caption,
      this.blogContent});
}
