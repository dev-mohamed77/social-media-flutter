import 'package:dartz/dartz.dart';

import 'package:socailmedia/core/failure/failure.dart';
import 'package:socailmedia/core/usecase/usecase.dart';
import 'package:socailmedia/features/comments/domain/entities/add_comment_entities.dart';
import 'package:socailmedia/features/comments/domain/repository/comment_repository.dart';

class UsecaseAddCommant extends UseCase<AddCommentEntities, CommnetParams> {
  final CommentRepository repo;
  UsecaseAddCommant({
    required this.repo,
  });

  @override
  Future<Either<Failure, AddCommentEntities>> call(CommnetParams params) async {
    return await repo.addComment(
        requestComment: RequestComment(
      postID: params.postID,
      comment: params.comment,
    ));
  }
}

class CommnetParams {
  final String postID;
  final String comment;
  CommnetParams({
    required this.postID,
    required this.comment,
  });
}
