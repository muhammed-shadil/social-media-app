// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'userprofile_bloc.dart';

@immutable
sealed class UserprofileState {}

final class UserprofileInitial extends UserprofileState {}

class UserProfileLoading extends UserprofileState {}

class UserProfileSuccess extends UserprofileState {
final CurrentUserProfiles userProfiles;
  UserProfileSuccess({
    required this.userProfiles,
  });
}

class UserProfileFaild extends UserprofileState {
  final String error;
  UserProfileFaild({
    required this.error,
  });
}
