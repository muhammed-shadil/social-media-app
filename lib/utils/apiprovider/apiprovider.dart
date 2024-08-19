import 'dart:convert';

import 'package:http/http.dart' as http;

class Apiprovider {
  Future<http.Response> signupUser(Map data) async {
    final response = await http.post(
      Uri.parse("https://social-nest-backend.vercel.app/user/signup"),
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );
    return response;
  }

  Future<http.Response> loginUser(Map data) async {
    final response = await http.post(
      Uri.parse("https://social-nest-backend.vercel.app/user/login"),
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );
    return response;
  }

  Future<http.Response> followerUnfollwers(String token, String userId) async {
    final response = await http.get(
      Uri.parse(
          "https://social-nest-backend.vercel.app/follow/fetch-followers/$userId"),
      headers: {
        'Content-Type': 'application/json',
        'x-refresh-token': token,
      },
    );
    return response;
  }

  Future<http.Response> suggestions(String token) async {
    print(token);
    final response = await http.get(
      Uri.parse(
          "https://social-nest-backend.vercel.app/follow/fetch-suggestions"),
      headers: {
        'Content-Type': 'application/json',
        'x-refresh-token': token,
      },
    );
    return response;
  }

  Future<http.Response> followingcall(String refreshtoken,String id) async {
    final response = await http.post(
        Uri.parse(
            "https://social-nest-backend.vercel.app/follow/follow-user/$id"),
        headers: {
          'Content-Type': 'application/json',
          'x-refresh-token': refreshtoken,
        });

    return response;
  }

  Future<http.Response> unfollowingcall(String refreshtoken,String id) async {
    final response = await http.post(
        Uri.parse(
            "https://social-nest-backend.vercel.app/follow/unfollow-user/$id"),
        headers: {
          'Content-Type': 'application/json',
          'x-refresh-token': refreshtoken,
        });

    return response;
  }
  Future<http.Response> myfollowing(String refreshtoken,String id) async {
    final response = await http.get(
        Uri.parse(
            "https://social-nest-backend.vercel.app/follow/fetch-following/$id"),
        headers: {
          'Content-Type': 'application/json',
          'x-refresh-token': refreshtoken,
        });

    return response;
  }
   Future<http.Response> currentuserprofile(String refreshtoken) async {
    final response = await http.get(
        Uri.parse(
            "https://social-nest-backend.vercel.app/post/get-posts"),
        headers: {
          'Content-Type': 'application/json',
          'x-refresh-token': refreshtoken,
        });

    return response;
  } Future<http.Response> userprofile(String refreshtoken,String id) async {
    final response = await http.get(
        Uri.parse(
            "https://social-nest-backend.vercel.app/user/66b48c13b31b234ee74fd081"),
        headers: {
          'Content-Type': 'application/json',
          'x-refresh-token': refreshtoken,
        });

    return response;
  }
}
