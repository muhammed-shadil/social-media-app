// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'follow_unfollow_bloc.dart';

@immutable
sealed class FollowUnfollowState {}

final class FollowUnfollowInitial extends FollowUnfollowState {}

class Faildfollow extends FollowUnfollowState {
  final String error;
  Faildfollow({
    required this.error,
  });
}

class Following extends FollowUnfollowState {
  final bool follow;
  Following({
    required this.follow,
  });
}

class Loadingstate extends FollowUnfollowState {}


