import 'package:dartz/dartz.dart';

import 'package:socailmedia/core/failure/failure.dart';
import 'package:socailmedia/features/comments/domain/entities/add_comment_entities.dart';
import 'package:socailmedia/features/comments/domain/entities/comment_entities.dart';

abstract class CommentRepository {
  Future<Either<Failure, AddCommentEntities>> addComment({
    required RequestComment requestComment,
  });

  Future<Either<Failure, CommentEntities>> getCommentsForPost({
    required RequestGetCommentsForPost requestGetCommentsForPost,
  });
}

class RequestComment {
  final String postID;
  final String comment;
  RequestComment({
    required this.postID,
    required this.comment,
  });
}

class RequestGetCommentsForPost {
  final String postID;
  RequestGetCommentsForPost({
    required this.postID,
  });
}
