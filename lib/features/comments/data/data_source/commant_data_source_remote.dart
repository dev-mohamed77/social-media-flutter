// ignore_for_file: unused_catch_clause

import 'package:socailmedia/core/failure/exception.dart';
import 'package:socailmedia/core/helper/dio_helper.dart';
import 'package:socailmedia/core/utils/constant.dart';
import 'package:socailmedia/features/comments/data/model/add_comment.dart';
import 'package:socailmedia/features/comments/data/model/comments_model.dart';

abstract class CommentDataSourceRemote {
  Future<AddCommentModel> addComment({
    required String postId,
    required String comment,
  });

  Future<CommentModel> fetchCommentsForPost({
    required String postId,
  });
}

class CommentDataSourceRemoteImp extends CommentDataSourceRemote {
  @override
  Future<AddCommentModel> addComment({
    required String postId,
    required String comment,
  }) async {
    try {
      var response = await DioHelper.postData(
        url: "comment/$postId/comments",
        data: {
          "comment": comment,
        },
        token: token,
      );
      return AddCommentModel.fromJson(response.data);
    } on NetworkException catch (err) {
      throw NetworkException;
    }
  }

  @override
  Future<CommentModel> fetchCommentsForPost({
    required String postId,
  }) async {
    try {
      var response = await DioHelper.fetchData(
        url: "comment/$postId/comments",
        token: token,
      );
      return CommentModel.fromJson(response.data);
    } on NetworkException catch (err) {
      throw NetworkException;
    }
  }
}
