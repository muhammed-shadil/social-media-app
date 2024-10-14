part of 'followers_bloc.dart';

@immutable
sealed class FollowersEvent {}

class FetchFollowerUnfollwerEvent extends FollowersEvent {}

class FetchFollowingsEvent extends FollowersEvent {
  final String? id;

  FetchFollowingsEvent({this.id});
}
