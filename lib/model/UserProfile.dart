class CurrentUserProfiles {
  User user;
  List<Post> posts;

  CurrentUserProfiles({
    required this.user,
    required this.posts,
  });

  factory CurrentUserProfiles.fromMap(Map<String, dynamic> json) =>
      CurrentUserProfiles(
        user: User.fromMap(json["user"]),
        posts: List<Post>.from(json["posts"].map((x) => Post.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "user": user.toMap(),
        "posts": List<dynamic>.from(posts.map((x) => x.toMap())),
      };
}

class Post {
  String id;
  String authorId;
  bool isDeleted;
  bool isArchived;
  List<String> likes;
  String contentType;
  String? imageUrl;
  String? caption; // Nullable caption
  String? blogContent; // Nullable blog content
  List<Comment> comments;
  String createdAt;
  String updatedAt;
  int v;

  Post({
    required this.id,
    required this.authorId,
    required this.isDeleted,
    required this.isArchived,
    required this.likes,
    required this.contentType,
    this.imageUrl,
    this.caption,
    this.blogContent,
    required this.comments,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Post.fromMap(Map<String, dynamic> json) => Post(
        id: json["_id"] ?? '', // Provide default empty string if null
        authorId: json["author_id"] ?? '',
        isDeleted: json["isDeleted"] ?? false,
        isArchived: json["isArchived"] ?? false,
        likes: List<String>.from(json["likes"]?.map((x) => x) ?? []),
        contentType: json["content_type"] ?? '',
        imageUrl: json["image_url"],
        caption: json["caption"], // Leave as nullable
        blogContent: json["blogContent"], // Leave as nullable
        comments: List<Comment>.from(
            json["comments"]?.map((x) => Comment.fromMap(x)) ?? []),
        createdAt: json["createdAt"] ?? '',
        updatedAt: json["updatedAt"] ?? '',
        v: json["__v"] ?? 0,
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "author_id": authorId,
        "isDeleted": isDeleted,
        "isArchived": isArchived,
        "likes": List<dynamic>.from(likes.map((x) => x)),
        "content_type": contentType,
        "image_url": imageUrl,
        "caption": caption,
        "blogContent": blogContent,
        "comments": List<dynamic>.from(comments.map((x) => x.toMap())),
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
      };
}

class Comment {
  String userId;
  String authorId;
  String content;
  String id;
  String createdAt;
  String updatedAt;

  Comment({
    required this.userId,
    required this.authorId,
    required this.content,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Comment.fromMap(Map<String, dynamic> json) => Comment(
        userId: json["user_id"] ?? '', // Provide default empty string if null
        authorId: json["author_id"] ?? '',
        content: json["content"] ?? '',
        id: json["_id"] ?? '',
        createdAt: json["createdAt"] ?? '',
        updatedAt: json["updatedAt"] ?? '',
      );

  Map<String, dynamic> toMap() => {
        "user_id": userId,
        "author_id": authorId,
        "content": content,
        "_id": id,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}

class User {
  String id;
  String username;
  String name;
  String email;
  String? profilePicture; // Nullable profile picture
  String? bio; // Nullable bio
  String? location; // Nullable location
  List<String> followers;
  List<String> following;
  List<dynamic> posts;
  String createdAt;
  String updatedAt;
  int v;
  String? refreshToken; // Nullable refresh token

  User({
    required this.id,
    required this.username,
    required this.name,
    required this.email,
    this.profilePicture,
    this.bio,
    this.location,
    required this.followers,
    required this.following,
    required this.posts,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    this.refreshToken,
  });

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["_id"] ?? '',
        username: json["username"] ?? '',
        name: json["name"] ?? '',
        email: json["email"] ?? '',
        profilePicture: json["profilePicture"], // Leave as nullable
        bio: json["bio"], // Leave as nullable
        location: json["location"], // Leave as nullable
        followers: List<String>.from(json["followers"]?.map((x) => x) ?? []),
        following: List<String>.from(json["following"]?.map((x) => x) ?? []),
        posts: List<dynamic>.from(json["posts"]?.map((x) => x) ?? []),
        createdAt: json["createdAt"] ?? '',
        updatedAt: json["updatedAt"] ?? '',
        v: json["__v"] ?? 0,
        refreshToken: json["refreshToken"], // Leave as nullable
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "username": username,
        "name": name,
        "email": email,
        "profilePicture": profilePicture,
        "bio": bio,
        "location": location,
        "followers": List<dynamic>.from(followers.map((x) => x)),
        "following": List<dynamic>.from(following.map((x) => x)),
        "posts": List<dynamic>.from(posts.map((x) => x)),
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
        "refreshToken": refreshToken,
      };
}
