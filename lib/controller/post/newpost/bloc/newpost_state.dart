part of 'newpost_bloc.dart';

@immutable
sealed class NewpostState {}

final class NewpostInitial extends NewpostState {}

class SuccessfullyCreatePost extends NewpostState {
  final String message;

  SuccessfullyCreatePost({required this.message});
}

class FaildCreatePost extends NewpostState {
  final String message;

  FaildCreatePost({required this.message});
}

class LoadingCreatePost extends NewpostState {}
// class Loading extends NewpostState {}
