// ignore_for_file: annotate_overrides, overridden_fields

import 'package:socailmedia/features/comments/domain/entities/add_comment_entities.dart';

class AddCommentModel extends AddCommentEntities {
  const AddCommentModel({
    required this.status,
    required this.message,
    required this.data,
  }) : super(status: status, message: message, data: data);

  final bool status;
  final String message;
  final AddCommentDataModel data;

  factory AddCommentModel.fromJson(Map<String, dynamic> json) {
    return AddCommentModel(
      status: json['status'],
      message: json['message'],
      data: AddCommentDataModel.fromJson(json['data']),
    );
  }
}

class AddCommentDataModel extends AddCommentEntitiesData {
  final String userID;
  final String postID;
  final String id;
  final String comment;
  final String createdAt;
  final String updatedAt;

  const AddCommentDataModel({
    required this.userID,
    required this.postID,
    required this.comment,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  }) : super(
            id: id,
            userID: userID,
            postID: postID,
            createdAt: createdAt,
            updatedAt: updatedAt,
            comment: comment);

  factory AddCommentDataModel.fromJson(Map<String, dynamic> json) {
    return AddCommentDataModel(
      userID: json['userID'],
      postID: json['postID'],
      comment: json['comment'],
      id: json['_id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
