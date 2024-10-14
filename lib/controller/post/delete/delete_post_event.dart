part of 'delete_post_bloc.dart';

@immutable
sealed class DeletePostEvent {}
class DeletePost extends DeletePostEvent{
  final String id;

  DeletePost({required this.id});
}