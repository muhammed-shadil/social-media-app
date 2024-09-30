import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trek/utils/apirepository/apirepository.dart';
import 'package:trek/utils/constants.dart';

part 'newpost_event.dart';
part 'newpost_state.dart';

Apirepository apirepository = Apirepository();

class NewpostBloc extends Bloc<NewpostEvent, NewpostState> {
  NewpostBloc() : super(NewpostInitial()) {
    on<CreateNewPost>(createNewPost);
  }

  FutureOr<void> createNewPost(
      CreateNewPost event, Emitter<NewpostState> emit) async {
    var sharedpref = await SharedPreferences.getInstance();

    final refreshtoken = sharedpref.getString(constants.accessToken);

    try {
      final File file = File(event.imagefile!.path);

      String filename = event.imagefile!.path.split('/').last;
      final response = await apirepository.createNewPost(
          contentType: "Image",
          blogcontent: "wertyuiokjhgfdsazxcvb",
          caption: "caption image",
          filename: filename,
          refreshtoken: refreshtoken!,
          file: file);

      print(response.statusCode);
      print(response.body);
    } catch (e) {}
  }
}
