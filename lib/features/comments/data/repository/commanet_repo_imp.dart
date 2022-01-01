import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:socailmedia/core/error/error_handel.dart';
import 'package:socailmedia/core/failure/exception.dart';

import 'package:socailmedia/core/failure/failure.dart';
import 'package:socailmedia/core/network/network_info.dart';
import 'package:socailmedia/features/comments/data/data_source/commant_data_source_remote.dart';
import 'package:socailmedia/features/comments/domain/entities/add_comment_entities.dart';
import 'package:socailmedia/features/comments/domain/entities/comment_entities.dart';
import 'package:socailmedia/features/comments/domain/repository/comment_repository.dart';

class CommentRepositoryImp implements CommentRepository {
  final CommentDataSourceRemote commentDataSourceRemote;
  final NetworkInfo networkInfo;

  CommentRepositoryImp({
    required this.commentDataSourceRemote,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, AddCommentEntities>> addComment({
    required RequestComment requestComment,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        var data = await commentDataSourceRemote.addComment(
          postId: requestComment.postID,
          comment: requestComment.comment,
        );

        if (data.status) {
          return Right(data);
        } else {
          return Left(StatusCodeHandle.unknown.getFailure());
        }
      } catch (err) {
        // print(err);
        if (err is DioError) {
          print(err.response?.data["message"]);
        }
        return Left(NetworkException.handle(err).failure);
      }
    } else {
      return Left(StatusCodeHandle.noInternet.getFailure());
    }
  }

  @override
  Future<Either<Failure, CommentEntities>> getCommentsForPost({
    required RequestGetCommentsForPost requestGetCommentsForPost,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        var data = await commentDataSourceRemote.fetchCommentsForPost(
          postId: requestGetCommentsForPost.postID,
        );
        if (data.status) {
          return Right(data);
        } else {
          return Left(StatusCodeHandle.notFound.getFailure());
        }
      } catch (err) {
        print(err);
        if (err is DioError) {
          print(err.response?.data["message"]);
        }
        return Left(NetworkException.handle(err).failure);
      }
    } else {
      return Left(StatusCodeHandle.noInternet.getFailure());
    }
  }
}
