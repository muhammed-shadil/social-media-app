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
}
