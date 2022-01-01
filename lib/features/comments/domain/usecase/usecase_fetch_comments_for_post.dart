import 'package:dartz/dartz.dart';

import 'package:socailmedia/core/failure/failure.dart';
import 'package:socailmedia/core/usecase/usecase.dart';
import 'package:socailmedia/features/comments/domain/entities/comment_entities.dart';
import 'package:socailmedia/features/comments/domain/repository/comment_repository.dart';

class UsecaseFetchCommentsForPost
    extends UseCase<CommentEntities, FetchParams> {
  final CommentRepository repo;
  UsecaseFetchCommentsForPost({
    required this.repo,
  });

  @override
  Future<Either<Failure, CommentEntities>> call(FetchParams params) async {
    print("params ${params.postId}");
    return await repo.getCommentsForPost(
      requestGetCommentsForPost:
          RequestGetCommentsForPost(postID: params.postId),
    );
  }
}

class FetchParams {
  FetchParams({
    required this.postId,
  });
  final String postId;
}
