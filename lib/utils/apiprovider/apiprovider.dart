import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trek/controller/followers_bloc/bloc/followers_bloc.dart';
import 'package:trek/model/FollewersUnfollowers_model.dart';

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

  Future<http.Response> followerUnfollwers() async {
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2Njk4ZTBmMWY4NWJjODc2Y2UzOWQ1Y2UiLCJpYXQiOjE3MjI5MjUzNTIsImV4cCI6MTcyMjkyNjI1Mn0.uMdLCHP2ned8jG_GID_ESwy_7XEZT3q8OlyRkt54-GQ";
    String refreshToken =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2Njk4ZTBmMWY4NWJjODc2Y2UzOWQ1Y2UiLCJpYXQiOjE3MjI5MjcyNjEsImV4cCI6MTcyMzUzMjA2MX0.WaDxBv5CKytQzJOT0dpjuzvjATW6976z8ZmlR0iacpk";
    final response = await http.get(
      Uri.parse(
          "https://social-nest-backend.vercel.app/follow/fetch-followers"),
      headers: {
        'Content-Type': 'application/json',
        // 'Authorization': 'Bearer $token',
        'x-refresh-token': refreshToken,
      },
    );
    print('Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');
    return response;
  }
   Future<http.Response> suggestions() async {
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2Njk4ZTBmMWY4NWJjODc2Y2UzOWQ1Y2UiLCJpYXQiOjE3MjI5MjUzNTIsImV4cCI6MTcyMjkyNjI1Mn0.uMdLCHP2ned8jG_GID_ESwy_7XEZT3q8OlyRkt54-GQ";
    String refreshToken =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2Njk4ZTBmMWY4NWJjODc2Y2UzOWQ1Y2UiLCJpYXQiOjE3MjI5MjcyNjEsImV4cCI6MTcyMzUzMjA2MX0.WaDxBv5CKytQzJOT0dpjuzvjATW6976z8ZmlR0iacpk";
    final response = await http.get(
      Uri.parse(
          "https://social-nest-backend.vercel.app/follow/fetch-suggestions"),
      headers: {
        'Content-Type': 'application/json',
        // 'Authorization': 'Bearer $token',
        'x-refresh-token': refreshToken,
      },
    );
    print('Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');
    return response;
  }
}
