import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:trek/model/usermodel.dart';
import 'package:trek/utils/apirepository/apirepository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Apirepository apirepository = Apirepository();
  LoginBloc() : super(LoginInitial()) {
    on<Loginevent>(login);
    on<Signupevent>(signup);
  }

  FutureOr<void> login(Loginevent event, Emitter<LoginState> emit) async {
    Map data = {"email": event.email, "password": event.password};
    try {
      final Response response = await apirepository.login(data);
      final result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(loginsuccess(message: result['accessToken']));
        print("${response.body} gggggggggggggg ${result['accessToken']}${result['username']}");
      } else {
        emit(loginerror(message: result['error']));
        print("${response.body} gggggggggggggg ${result['error']}");
      }
    } catch (e) {
      emit(loginerror(message: e.toString()));

      print(e);
    }
  }

  Future<FutureOr<void>> signup(
      Signupevent event, Emitter<LoginState> emit) async {
    Map data = {
      "email": event.user.email,
      "password": event.user.password,
      "username": event.user.username
    };

    try {
      final Response response = await apirepository.signup(data);
      final result = jsonDecode(response.body);

      if (response.statusCode == 201) {
        emit(Signupsuccess(message: result['message']));
        // print("${response.body} gggggggggggggg ${result['message']}");
      } else {
        emit(Signuperror(message: result['error']));
        // print("${response.body} gggggggggggggg ${result['error']}");
      }
    } catch (e) {
      emit(Signuperror(message: e.toString()));

      // print(e);
    }
  }
}
