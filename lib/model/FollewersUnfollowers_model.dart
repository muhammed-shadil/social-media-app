class FollowersUnfollowers {
  List<Suggestion> suggestions;

  FollowersUnfollowers({
    required this.suggestions,
  });

  factory FollowersUnfollowers.fromJson(Map<String, dynamic> json) =>
      FollowersUnfollowers(
        suggestions: List<Suggestion>.from(
            json["suggestions"].map((x) => Suggestion.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "suggestions": List<dynamic>.from(suggestions.map((x) => x.toJson())),
      };
}

class Suggestion {
  String id;
  String username;
  String? name;
  String? email;
  String profilePicture;

  Suggestion({
    required this.id,
    required this.username,
    this.name,
    this.email,
    required this.profilePicture,
  });

  factory Suggestion.fromJson(Map<String, dynamic> json) => Suggestion(
        id: json["_id"],
        username: json["username"],
        name: json["name"],
        email: json["email"],
        profilePicture: json["profilePicture"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "name": name,
        "email": email,
        "profilePicture": profilePicture,
      };
}
