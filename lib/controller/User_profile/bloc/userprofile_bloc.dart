import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trek/model/UserProfile.dart';
import 'package:trek/utils/apirepository/apirepository.dart';
import 'package:trek/utils/constants.dart';

part 'userprofile_event.dart';
part 'userprofile_state.dart';

class UserprofileBloc extends Bloc<UserprofileEvent, UserprofileState> {
  Apirepository apirepository = Apirepository();

  UserprofileBloc() : super(UserprofileInitial()) {
    on<UserprofileEvent>(currentuserprofile);
  }

  FutureOr<void> currentuserprofile(
      UserprofileEvent event, Emitter<UserprofileState> emit) async {
    emit(UserProfileLoading());
    var sharedpref = await SharedPreferences.getInstance();
    CurrentUserProfiles results;
    final token = sharedpref.getString(constants.accessToken);

    try {
      final Response response = await apirepository.currentuserprofile(token!);
      final result = jsonDecode(response.body);
      print(result);
      print(response.statusCode);
      if (response.statusCode == 200) {
        results = CurrentUserProfiles.fromMap(result);
        print(results.posts);
        print(results.user.email);
        print(results.user.profilePicture);
        print(results);
        emit(UserProfileSuccess(userProfiles: results));
      } else {
        emit(UserProfileFaild(error: 'message'));
      }
    } catch (e) {
      emit(UserProfileFaild(error: 'message'));
    }
  }
}
