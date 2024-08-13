// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'followers_bloc.dart';

@immutable
sealed class FollowersState {}

final class FollowersInitial extends FollowersState {}

class SuccessFollewersUnfollowers extends FollowersState {
  final FollowersUnfollowers followersUnfollowers;
  final List<Suggestion> suggestons;
  SuccessFollewersUnfollowers({
    required this.followersUnfollowers,
    required this.suggestons,
  });
}

class FaildFollewersUnfollowers extends FollowersState {
  final String error;

  FaildFollewersUnfollowers({required this.error});
}

 class FetchFollowLoadingstate extends FollowersState {}
