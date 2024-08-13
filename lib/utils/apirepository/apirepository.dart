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

  Future<http.Response> following(String token,String id) async {
    return apiprovider.followingcall(token,id);
  }

  Future<http.Response> unfollowing(String token,String id) async {
    return apiprovider.unfollowingcall(token,id);
  }
}
