// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'follow_unfollow_bloc.dart';

@immutable
sealed class FollowUnfollowEvent {}

class FollowingEvent extends FollowUnfollowEvent {
  final String id;
  FollowingEvent({
    required this.id,
  });
}

class UnfollowingEvent extends FollowUnfollowEvent {
  final String id;

  UnfollowingEvent({required this.id});
}
