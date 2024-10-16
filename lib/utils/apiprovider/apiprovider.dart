import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

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

  Future<http.Response> followingcall(String refreshtoken, String id) async {
    final response = await http.post(
        Uri.parse(
            "https://social-nest-backend.vercel.app/follow/follow-user/$id"),
        headers: {
          'Content-Type': 'application/json',
          'x-refresh-token': refreshtoken,
        });

    return response;
  }

  Future<http.Response> unfollowingcall(String refreshtoken, String id) async {
    final response = await http.post(
        Uri.parse(
            "https://social-nest-backend.vercel.app/follow/unfollow-user/$id"),
        headers: {
          'Content-Type': 'application/json',
          'x-refresh-token': refreshtoken,
        });

    return response;
  }

  Future<http.Response> myfollowing(String refreshtoken, String id) async {
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
        Uri.parse("https://social-nest-backend.vercel.app/post/get-posts"),
        headers: {
          'Content-Type': 'application/json',
          'x-refresh-token': refreshtoken,
        });

    return response;
  }

  Future<http.Response> userprofile(String refreshtoken, String id) async {
    final response = await http.get(
        Uri.parse("https://social-nest-backend.vercel.app/user/$id"),
        headers: {
          'Content-Type': 'application/json',
          'x-refresh-token': refreshtoken,
        });

    return response;
  }

  Future<http.Response> fetchAllposts(
      int limit, int currentPage, String refreshtoken) async {
    final response = await http.get(
      Uri.parse(
          'https://social-nest-backend.vercel.app/post/all-posts?page=$currentPage&limit=$limit'),
      headers: {
        'Content-Type': 'application/json',
        'x-refresh-token': refreshtoken,
      },
    );
    return response;
  }

  Future<http.Response> createNewPost(
      String contentType,
      String caption,
      String? blogcontent,
      File? file,
      String? filename,
      String refreshtoken) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("https://social-nest-backend.vercel.app/post/create"),
    );

    Map<String, String> headers = {
      'x-refresh-token': refreshtoken,
    };

    request.headers.addAll(headers);

    if (contentType == "Image" && file != null) {
      // Handle image upload
      request.files.add(http.MultipartFile(
        'image',
        file.readAsBytes().asStream(),
        file.lengthSync(),
        filename: filename,
        contentType: MediaType("image", "png"),
      ));

      request.fields.addAll({
        "contentType": contentType,
        "caption": caption,
      });
    } else if (contentType == "Blog" && blogcontent != null) {
      // Handle blog post (no image)
      request.fields.addAll({
        "contentType": contentType,
        "caption": caption,
        "blogContent": blogcontent,
      });
    }

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    return response;
  }
   Future<http.Response> deletepost(String refreshtoken, String id) async {
    final response = await http.delete(
        Uri.parse("https://social-nest-backend.vercel.app/post/delete-post/$id"),
        headers: {
          'Content-Type': 'application/json',
          'x-refresh-token': refreshtoken,
        });

    return response;
  }
}
