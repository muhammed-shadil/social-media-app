// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'userprofile_bloc.dart';

@immutable
sealed class UserprofileEvent {}

class CurrentUserProfile extends UserprofileEvent {
  final String id;

  CurrentUserProfile({required this.id});
}

class UserProfile extends UserprofileEvent {
  final String id;
  UserProfile({
    required this.id,
  });
}
