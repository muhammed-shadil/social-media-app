import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:trek/model/UserProfile.dart';
import 'package:trek/model/postmodel.dart';
import 'package:trek/utils/constants.dart';

part 'fetch_posts_state.dart';

class FetchPostsCubit extends Cubit<FetchPostsState> {
  FetchPostsCubit() : super(FetchPostsInitial());

  int _currentPage = 1;
  final int _limit = 2;
  bool _hasMoreData = true;
  List<Fetchpost> _posts = [];

  Future<void> fetchPosts() async {
    print("dddddddddddddddddddddddd");

    if (!_hasMoreData) return;
    var sharedpref = await SharedPreferences.getInstance();

    final token = sharedpref.getString(constants.accessToken);
    emit(PostLoading(
        posts: _posts)); // Emit current posts with a loading indicator

    try {
      final response = await http.get(
        Uri.parse(
            'https://social-nest-backend.vercel.app/post/all-posts?page=$_currentPage&limit=$_limit'),
        headers: {
          'Content-Type': 'application/json',
          'x-refresh-token': token!,
        },
      );
      print("qqqqqqqqqqqqqqqqqqqq");
      print(response.statusCode);

      if (response.statusCode == 200) {
        print(response);
        print(response.statusCode);
        print(response.body);
        // List<Post> fetchedPosts
        // = (json.decode(response.body))
        //     .map((data) => Post.fromJson(data))
        //     .toList();

        final result = jsonDecode(response.body);
        print(result.runtimeType);
        List<Fetchpost> fetchedPosts = fetchpostFromMap(result);
        _posts.addAll(fetchedPosts);
        _currentPage++;
        print(_posts);
        if (fetchedPosts.length < _limit) {
          _hasMoreData = false;
        }
        print("rrrrrrrrrrrrrrr");
        emit(PostLoaded(posts: _posts, hasMoreData: _hasMoreData));
      } else {
        emit(PostError(message: 'Failed to load posts'));
      }
    } catch (e) {
      print(e);
      emit(PostError(message: 'Failed to load posts'));
    }
  }
}
