import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trek/model/FollewersUnfollowers_model.dart';
import 'package:trek/utils/apirepository/apirepository.dart';
import 'package:trek/utils/constants.dart';

part 'followers_event.dart';
part 'followers_state.dart';

class FollowersBloc extends Bloc<FollowersEvent, FollowersState> {
  final Apirepository apirepository = Apirepository();

  FollowersBloc() : super(FollowersInitial()) {
    on<FetchFollowerUnfollwerEvent>(fetchFollowerUnfollwerbloc);
  }

  FutureOr<void> fetchFollowerUnfollwerbloc(
      FetchFollowerUnfollwerEvent event, Emitter<FollowersState> emit) async {
    emit(FetchFollowLoadingstate());
    FollowersUnfollowers results2;
    List<Suggestion> results1;
    var sharedpref = await SharedPreferences.getInstance();

    final token = sharedpref.getString(constants.accessToken);
    final userid = sharedpref.getString(constants.userid);
    try {
      final Response response1 = await apirepository.suggestion(token!);
      final Response response2 =
          await apirepository.followunfollower(token, userid!);
      final result1 = jsonDecode(response1.body);
      final result2 = jsonDecode(jsonEncode(response2.body));
      print(result2);
      print(result1);
      if (response1.statusCode == 200 || response2.statusCode == 200) {
        results2 = FollowersUnfollowers.fromJson(result1);
        results1 = suggestionFromMap(result2.toString());
        print(results1);
        print(results2);
        emit(SuccessFollewersUnfollowers(
          followersUnfollowers: results2,
          suggestons: results1,
        ));
      } else {
        emit(FaildFollewersUnfollowers(error: result1['error']));
      }
    } catch (e) {
      emit(FaildFollewersUnfollowers(error: e.toString()));
    }
  }
}