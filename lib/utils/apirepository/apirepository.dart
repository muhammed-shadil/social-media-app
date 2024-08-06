import 'package:trek/utils/apiprovider/apiprovider.dart';
import 'package:http/http.dart'as http;
class Apirepository {
  final Apiprovider apiprovider = Apiprovider();

  
  Future<http.Response> signup(Map data) async {
    return apiprovider.signupUser(data);
  } 
  Future<http.Response> login(Map data) async {
    return apiprovider.loginUser(data);
  }
   Future<http.Response> followunfollower() async {
    return apiprovider.followerUnfollwers();
  }
    Future<http.Response> suggestion() async {
    return apiprovider.suggestions();
  }
}
