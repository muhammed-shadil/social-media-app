import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trek/utils/apirepository/apirepository.dart';
import 'package:trek/utils/constants.dart';

part 'delete_post_event.dart';
part 'delete_post_state.dart';

class DeletePostBloc extends Bloc<DeletePostEvent, DeletePostState> {
  DeletePostBloc() : super(DeletePostInitial()) {
    on<DeletePost>(deletepost);
  }

  final Apirepository apirepository = Apirepository();
  FutureOr<void> deletepost(
      DeletePost event, Emitter<DeletePostState> emit) async {
    emit(LoadingDeletePost());
    try {
      var sharedpref = await SharedPreferences.getInstance();
      final refreshtoken = sharedpref.getString(constants.accessToken);
      final Response response =
          await apirepository.delete(refreshtoken!, event.id);
      final result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(SuccessfullyDeletePost(message: result['message']));
      } else {
        emit(FaildDeletePost(message: result['message']));
      }
    } catch (e) {
      emit(FaildDeletePost(message: e.toString()));
    }
  }
}
