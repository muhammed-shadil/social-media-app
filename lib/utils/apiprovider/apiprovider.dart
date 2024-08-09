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
}
