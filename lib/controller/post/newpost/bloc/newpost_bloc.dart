// import 'dart:async';
// import 'dart:io';

// import 'package:bloc/bloc.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:meta/meta.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:trek/utils/constants.dart';

// part 'newpost_event.dart';
// part 'newpost_state.dart';

// class NewpostBloc extends Bloc<NewpostEvent, NewpostState> {
//   NewpostBloc() : super(NewpostInitial()) {
//     on<CreateNewPost>(createNewPost);
//   }

//   FutureOr<void> createNewPost(
//       CreateNewPost event, Emitter<NewpostState> emit) async {
//     // final File file = "event.imagefile";

//           String filename =
//               'Images/${DateTime.now().millisecondsSinceEpoch}.png';
//     var sharedpref = await SharedPreferences.getInstance();

//     final token = sharedpref.getString(constants.accessToken);
//     var request = http.MultipartRequest(
//       'POST',
//       Uri.parse("https://social-nest-backend.vercel.app/post/create"),
//     );
//     Map<String, String> headers = {
//       "Authorization": "Bearer $token",
//       "Content-type": "multipart/form-data"
//     };
//     request.files.add(
//       http.MultipartFile(
//         // 'file',
//         // file.readAsBytes().asStream(),
//         // file.lengthSync(),
//         // filename: filename,
//         // contentType: 
//       // ),
//     );
//     request.headers.addAll(headers);
//     request.fields
//         .addAll({"name": "test", "email": "test@gmail.com", "id": "12345"});
//   }
// }
