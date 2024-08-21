
class CurrentUserProfiles {
    User user;
    List<Post> posts;

    CurrentUserProfiles({
        required this.user,
        required this.posts,
    });

    factory CurrentUserProfiles.fromMap(Map<String, dynamic> json) => CurrentUserProfiles(
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
    String caption;
    String blogContent;
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
        required this.caption,
        required this.blogContent,
        required this.comments,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory Post.fromMap(Map<String, dynamic> json) => Post(
        id: json["_id"],
        authorId: json["author_id"],
        isDeleted: json["isDeleted"],
        isArchived: json["isArchived"],
        likes: List<String>.from(json["likes"].map((x) => x)),
        contentType: json["content_type"],
        caption: json["caption"],
        blogContent: json["blogContent"],
        comments: List<Comment>.from(json["comments"].map((x) => Comment.fromMap(x))),
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "author_id": authorId,
        "isDeleted": isDeleted,
        "isArchived": isArchived,
        "likes": List<dynamic>.from(likes.map((x) => x)),
        "content_type": contentType,
        "caption": caption,
        "blogContent": blogContent,
        "comments": List<dynamic>.from(comments.map((x) => x.toMap())),
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
    };

  static fromJson(data) {}
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
        userId: json["user_id"],
        authorId: json["author_id"],
        content: json["content"],
        id: json["_id"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
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
    String profilePicture;
    String bio;
    String location;
    List<String> followers;
    List<String> following;
    List<dynamic> posts;
    String createdAt;
    String updatedAt;
    int v;
    String refreshToken;

    User({
        required this.id,
        required this.username,
        required this.name,
        required this.email,
        required this.profilePicture,
        required this.bio,
        required this.location,
        required this.followers,
        required this.following,
        required this.posts,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
        required this.refreshToken,
    });

    factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["_id"],
        username: json["username"],
        name: json["name"],
        email: json["email"],
        profilePicture: json["profilePicture"],
        bio: json["bio"],
        location: json["location"],
        followers: List<String>.from(json["followers"].map((x) => x)),
        following: List<String>.from(json["following"].map((x) => x)),
        posts: List<dynamic>.from(json["posts"].map((x) => x)),
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
        refreshToken: json["refreshToken"],
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
