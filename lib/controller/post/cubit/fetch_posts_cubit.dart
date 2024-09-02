import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:trek/model/UserProfile.dart';
import 'package:trek/model/postmodel.dart';
import 'package:trek/utils/apirepository/apirepository.dart';
import 'package:trek/utils/constants.dart';

part 'fetch_posts_state.dart';

class FetchPostsCubit extends Cubit<FetchPostsState> {
  Apirepository apirepository = Apirepository();

  FetchPostsCubit() : super(FetchPostsInitial());

  int _currentPage = 1;
  final int _limit = 2;
  bool _hasMoreData = true;
  List<Fetchpost> _posts = [];
  bool _isLoadingMore = false;
  Future<void> fetchPosts() async {
    print("dddddddddddddddddddddddd");
    if (!_hasMoreData || _isLoadingMore) return;
    _isLoadingMore = true;
    var sharedpref = await SharedPreferences.getInstance();

    final token = sharedpref.getString(constants.accessToken);
    emit(PostLoading(
        posts: _posts)); // Emit current posts with a loading indicator

    try {
      final Response response =
          await apirepository.fetchAllposts(token!, _limit, _currentPage);
      print("qqqqqqqqqqqqqqqqqqqq");
      print(response.statusCode);

      if (response.statusCode == 200) {
        print(response);
        print(response.statusCode);
        print(response.body);

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
        _isLoadingMore = false;
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
