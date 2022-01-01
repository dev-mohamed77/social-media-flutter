class PostsModel {
  PostsModel({
    required this.status,
    required this.message,
    required this.data,
  });
  late final bool status;
  String? message;
  late final List<Post> data;

  PostsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json["message"];
    data = List.from(json['data']).map((e) => Post.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.map((post) => Post.toJson(post)).toList();
    return _data;
  }
}

class Post {
  Post({
    required this.id,
    required this.userID,
    required this.description,
    required this.image,
    required this.likes,
    required this.islike,
    required this.comments,
    required this.createdAt,
    required this.updatedAt,
  });
  String? id;
  User? userID;
  String? description;
  String? image;
  List<User>? likes;
  bool? islike;
  List<Comments>? comments;
  String? createdAt;
  String? updatedAt;

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json["_id"],
      userID: json["userID"] != null ? User.fromJson(json["userID"]) : null,
      description: json["description"],
      image: json["image"],
      islike: json["isLike"],
      likes: json['likes'] != null
          ? List.from(json['likes']).map((user) => User.fromJson(user)).toList()
          : null,
      comments: json['comments'] != null
          ? List.from(json['comments'])
              .map((user) => Comments.fromJson(user))
              .toList()
          : null,
      createdAt: json["createdAt"],
      updatedAt: json["updatedAt"],
    );
  }

  static Map<String, dynamic> toJson(Post post) {
    return {
      "_id": post.id,
      "userID": post.userID,
      "description": post.description,
      "image": post.image,
      // "likes": post.likes,
      // "comments": post.comments,
      "createdAt": post.createdAt,
      "updatedAt": post.updatedAt,
    };
  }
}

class User {
  User({
    required this.id,
    required this.username,
    required this.fullName,
    required this.image,
  });
  String? id;
  String? username;
  String? fullName;
  String? image;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["_id"],
      username: json["username"],
      fullName: json["fullName"],
      image: json["image"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['username'] = username;
    _data['fullName'] = fullName;
    _data['image'] = image;
    return _data;
  }
}

class Comments {
  Comments({
    required this.userID,
    required this.comment,
    required this.id,
  });
  User? userID;
  String? comment;
  String? id;

  factory Comments.fromJson(Map<String, dynamic> json) {
    return Comments(
      userID: json["id"] != null ? User.fromJson(json["id"]) : null,
      comment: json['comment'],
      id: json['_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data['id'] = id;
    _data['comment'] = comment;
    _data['_id'] = userID;
    return _data;
  }
}
