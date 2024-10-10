import 'dart:async';
import 'dart:convert';
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
    emit(LoadingCreatePost());
    // emit(Loading());
    print('loading');
    var sharedpref = await SharedPreferences.getInstance();

    final refreshtoken = sharedpref.getString(constants.accessToken);

    try {
      File? file; // Declare file as nullable
      String? filename;

      if (event.imagefile != null && event.postType == "Image") {
        // Only process the image file if it's an image post
        file = File(event.imagefile!.path);
        filename = event.imagefile!.path.split('/').last;
      }

      final response = await apirepository.createNewPost(
          contentType: event.postType,
          blogcontent: event.blogContent,
          caption: event.caption,
          filename: filename, // Filename can be null for non-image posts
          refreshtoken: refreshtoken!,
          file: file); // File can be null for non-image posts

      print(response.statusCode);
      print(response.body);
      final result = jsonDecode(response.body);

      if (response.statusCode == 201) {
        emit(SuccessfullyCreatePost(message: "Successfully Posted"));
      } else {
        emit(FaildCreatePost(message: result['message']));
      }
    } catch (e) {
      print("Error: ${e.toString()}");
      emit(FaildCreatePost(message: e.toString()));
    }
  }
}
