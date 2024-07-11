// ignore_for_file: public_member_api_docs, sort_constructors_first

class Usermodel {
  String? fullname;
  String? username;
  String? password;
  String? email;
  Usermodel({
    this.fullname,
    this.username,
    this.password,
    this.email,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fullname': fullname,
      'username': username,
      'password': password,
      'email': email,
    };
  }

  factory Usermodel.fromMap(Map<String, dynamic> map) {
    return Usermodel(
      fullname: map['fullname'] as String,
      username: map['username'] as String,
      password: map['password'] as String,
      email: map['email'] as String,
    );
  }

 }
