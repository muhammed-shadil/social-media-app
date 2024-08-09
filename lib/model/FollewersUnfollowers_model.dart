import 'dart:convert';

class FollowersUnfollowers {
  List<Suggestion> suggestions;

  FollowersUnfollowers({
    required this.suggestions,
  });

  factory FollowersUnfollowers.fromJson(Map<String, dynamic> json) =>
      FollowersUnfollowers(
        suggestions: List<Suggestion>.from(
            json["suggestions"].map((x) => Suggestion.fromMap(x))),
      );
// factory FollowersUnfollowers.fromJson(Map<String, dynamic> json) {
//   final suggestions = json["suggestions"] != null
//       ? List<Suggestion>.from(json["suggestions"].map((x) => Suggestion.fromMap(x)))
//       : List<Suggestion>.from(json.values.map((entry) => Suggestion.fromMap(entry.value)));
//   return FollowersUnfollowers(suggestions: suggestions);
// }

  Map<String, dynamic> toJson() => {
        "suggestions": List<dynamic>.from(suggestions.map((x) => x.toMap())),
      };
}

List<Suggestion> suggestionFromMap(String str) =>
    List<Suggestion>.from(json.decode(str).map((x) => Suggestion.fromMap(x)));

String suggestionToMap(List<Suggestion> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Suggestion {
  String id;
  String username;
  String name;
  String profilePicture;

  Suggestion({
    required this.id,
    required this.username,
    required this.name,
    required this.profilePicture,
  });

  factory Suggestion.fromMap(Map<String, dynamic> json) => Suggestion(
        id: json["_id"],
        username: json["username"],
        name: json["name"],
        profilePicture: json["profilePicture"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "username": username,
        "name": name,
        "profilePicture": profilePicture,
      };
}
