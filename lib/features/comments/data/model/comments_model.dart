// ignore_for_file: overridden_fields, annotate_overrides

import 'package:socailmedia/features/comments/domain/entities/comment_entities.dart';

class CommentModel extends CommentEntities {
  late final bool status;
  late final List<CommentDataModel> data;

  CommentModel({
    required this.status,
    required this.data,
  }) : super(status: status, data: data);

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
        status: json["status"],
        data: List.from(json['data'])
            .map((comment) => CommentDataModel.fromJson(comment))
            .toList());
  }
}

class CommentDataModel extends CommentData {
  late final String id;
  late final UserCommentModel userID;
  late final PostCommentModel postId;
  late final String comment;
  late final String createdAt;
  late final String updatedAt;

  CommentDataModel({
    required this.id,
    required this.userID,
    required this.postId,
    required this.comment,
    required this.createdAt,
    required this.updatedAt,
  }) : super(
          id: id,
          comment: comment,
          createdAt: createdAt,
          postId: postId,
          updatedAt: updatedAt,
          userID: userID,
        );

  factory CommentDataModel.fromJson(Map<String, dynamic> json) {
    return CommentDataModel(
      id: json["_id"],
      userID: UserCommentModel.fromJson(json["userID"]),
      postId: PostCommentModel.fromJson(json["postID"]),
      comment: json["comment"],
      createdAt: json["createdAt"],
      updatedAt: json["updatedAt"],
    );
  }
}

class PostCommentModel extends PostComment {
  final String image;
  final String id;

  const PostCommentModel({
    required this.image,
    required this.id,
  }) : super(
          id: id,
          image: image,
        );

  factory PostCommentModel.fromJson(Map<String, dynamic> json) {
    return PostCommentModel(
      image: json["image"],
      id: json["_id"],
    );
  }
}

class UserCommentModel extends UserComment {
  const UserCommentModel({
    required this.id,
    required this.username,
    required this.fullName,
    required this.image,
  }) : super(
          id: id,
          username: username,
          fullName: fullName,
          image: image,
        );

  final String id;
  final String username;
  final String fullName;
  final String image;

  factory UserCommentModel.fromJson(Map<String, dynamic> json) {
    return UserCommentModel(
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
