import 'package:equatable/equatable.dart';

class AddCommentEntities extends Equatable {
  final bool status;
  final String message;
  final AddCommentEntitiesData data;

  const AddCommentEntities({
    required this.status,
    required this.message,
    required this.data,
  });

  @override
  List<Object?> get props => [status, message, data];
}

class AddCommentEntitiesData extends Equatable {
  final String userID;
  final String postID;
  final String id;
  final String comment;
  final String createdAt;
  final String updatedAt;

  const AddCommentEntitiesData({
    required this.userID,
    required this.postID,
    required this.id,
    required this.comment,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props =>
      [id, userID, postID, createdAt, updatedAt, comment];
}
