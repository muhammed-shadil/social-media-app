// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'fetch_posts_cubit.dart';

@immutable
sealed class FetchPostsState {}

final class FetchPostsInitial extends FetchPostsState {}

class PostLoading extends FetchPostsState {
  final List<Fetchpost> posts;
  PostLoading({
    required this.posts,
  });
}

class PostLoaded extends FetchPostsState {
  final List<Fetchpost> posts;
  final bool hasMoreData;
  PostLoaded({
    required this.posts,
    required this.hasMoreData,
  });
}

class PostError extends FetchPostsState {
  final String message;
  PostError({
    required this.message,
  });
}
