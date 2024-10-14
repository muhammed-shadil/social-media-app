import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:trek/utils/apiprovider/apiprovider.dart';
import 'package:http/http.dart' as http;

class Apirepository {
  final Apiprovider apiprovider = Apiprovider();

  Future<http.Response> signup(Map data) async {
    return apiprovider.signupUser(data);
  }

  Future<http.Response> login(Map data) async {
    return apiprovider.loginUser(data);
  }

  Future<http.Response> followunfollower(String token, String userId) async {
    return apiprovider.followerUnfollwers(token, userId);
  }

  Future<http.Response> suggestion(String token) async {
    return apiprovider.suggestions(token);
  }

  Future<http.Response> following(String token, String id) async {
    return apiprovider.followingcall(token, id);
  }

  Future<http.Response> unfollowing(String token, String id) async {
    return apiprovider.unfollowingcall(token, id);
  }

  Future<http.Response> myfollowings(String token, String id) async {
    return apiprovider.myfollowing(token, id);
  }

  Future<http.Response> currentuserprofile(String token) async {
    return apiprovider.currentuserprofile(token);
  }

  Future<http.Response> userprofile(String token, String id) async {
    return apiprovider.userprofile(token, id);
  }

  Future<http.Response> fetchAllposts(
      String token, int limit, int currentPage) async {
    return apiprovider.fetchAllposts(limit, currentPage, token);
  }

  Future<http.Response> createNewPost(
      {required String contentType,
      required String caption,
      String? blogcontent,
      File? file,
      String? filename,
      required String refreshtoken}) {
    return apiprovider.createNewPost(
        contentType, caption, blogcontent, file, filename, refreshtoken);
  }
  Future<http.Response> delete(String token, String id) async {
    return apiprovider.deletepost(token, id);
  }
}
