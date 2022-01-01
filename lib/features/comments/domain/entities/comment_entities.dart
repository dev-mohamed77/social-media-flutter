import 'package:equatable/equatable.dart';

class CommentEntities extends Equatable {
  final bool status;

  final List<CommentData> data;
  const CommentEntities({
    required this.status,
    required this.data,
  });
  @override
  List<Object?> get props => [status, data];
}

class CommentData extends Equatable {
  final String id;
  final UserComment userID;
  final PostComment postId;
  final String comment;
  final String createdAt;
  final String updatedAt;

  const CommentData({
    required this.id,
    required this.userID,
    required this.postId,
    required this.comment,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        userID,
        postId,
        comment,
        createdAt,
        updatedAt,
      ];
}

class UserComment extends Equatable {
  final String id;
  final String username;
  final String fullName;
  final String image;

  const UserComment({
    required this.id,
    required this.username,
    required this.fullName,
    required this.image,
  });

  @override
  List<Object?> get props => [id, username, fullName, image];
}

class PostComment extends Equatable {
  final String id;
  final String image;

  const PostComment({
    required this.id,
    required this.image,
  });

  @override
  List<Object?> get props => [
        id,
        image,
      ];
}
