part of 'delete_post_bloc.dart';

@immutable
sealed class DeletePostState {}

final class DeletePostInitial extends DeletePostState {}

class SuccessfullyDeletePost extends DeletePostState {
  final String message;

  SuccessfullyDeletePost({required this.message});
}

class FaildDeletePost extends DeletePostState {
  final String message;

  FaildDeletePost({required this.message});
}

class LoadingDeletePost extends DeletePostState {}
