import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trek/utils/apirepository/apirepository.dart';
import 'package:trek/utils/constants.dart';
part 'follow_unfollow_event.dart';
part 'follow_unfollow_state.dart';

class FollowUnfollowBloc
    extends Bloc<FollowUnfollowEvent, FollowUnfollowState> {
  final Apirepository apirepository = Apirepository();

  FollowUnfollowBloc() : super(FollowUnfollowInitial()) {
    on<FollowingEvent>(followingbloc);
    on<UnfollowingEvent>(unfollowingbloc);
  }
  FutureOr<void> followingbloc(
      FollowingEvent event, Emitter<FollowUnfollowState> emit) async {
    emit(Loadingstate());
    var sharedpref = await SharedPreferences.getInstance();

    final token = sharedpref.getString(constants.accessToken);
    final userid = sharedpref.getString(constants.userid);
    try {
      final Response response = await apirepository.following(token!, event.id);
      final result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(Following(follow: false));
      } else {
        emit(Faildfollow(error: result['message']));
      }
    } catch (e) {
      emit(Faildfollow(error: e.toString()));
    }
  }

  FutureOr<void> unfollowingbloc(
      UnfollowingEvent event, Emitter<FollowUnfollowState> emit) async {
    emit(Loadingstate());
    var sharedpref = await SharedPreferences.getInstance();

    final token = sharedpref.getString(constants.accessToken);
    final userid = sharedpref.getString(constants.userid);
    try {
      final Response response =
          await apirepository.unfollowing(token!, event.id);
      final result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(Following(follow: true));
      } else {
        emit(Faildfollow(error: result['message']));
      }
    } catch (e) {
      emit(Faildfollow(error: e.toString()));
    }
  }
}
