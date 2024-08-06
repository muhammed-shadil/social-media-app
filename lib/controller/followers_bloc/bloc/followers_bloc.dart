import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:trek/model/FollewersUnfollowers_model.dart';
import 'package:trek/utils/apirepository/apirepository.dart';

part 'followers_event.dart';
part 'followers_state.dart';

class FollowersBloc extends Bloc<FollowersEvent, FollowersState> {
  final Apirepository apirepository = Apirepository();

  FollowersBloc() : super(FollowersInitial()) {
    on<FollowerUnfollwerEvent>(FollowerUnfollwerbloc);
  }

  FutureOr<void> FollowerUnfollwerbloc(
      FollowerUnfollwerEvent event, Emitter<FollowersState> emit) async {
    FollowersUnfollowers results1;
    Suggestion results2;
    try {
      final Response response1 = await apirepository.followunfollower();
      final Response response2 = await apirepository.suggestion();

      final result2 = jsonDecode(response2.body);

      final result1 = jsonDecode(response1.body);

      if (response1.statusCode == 200 && response2.statusCode == 200) {
        results1 = FollowersUnfollowers.fromJson(result1);
        results2 = Suggestion.fromJson(result2);

        emit(SuccessFollewersUnfollowers(
            followersUnfollowers: results1, suggestion: results2));
      } else {
        emit(FaildFollewersUnfollowers(error: result1['error']));
      }
    } catch (e) {
      emit(FaildFollewersUnfollowers(error: e.toString()));
    }
  }
}
