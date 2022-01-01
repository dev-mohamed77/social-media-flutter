import 'dart:async';

import 'package:rxdart/subjects.dart';
import 'package:socailmedia/core/base_manager/base_manager.dart';
import 'package:socailmedia/core/base_manager/common/state_flow.dart';
import 'package:socailmedia/core/base_manager/common/state_render.dart';
import 'package:socailmedia/core/utils/strings_manager.dart';
import 'package:socailmedia/features/comments/domain/entities/add_comment_entities.dart';
import 'package:socailmedia/features/comments/domain/entities/comment_entities.dart';
import 'package:socailmedia/features/comments/domain/usecase/usecase_add_comment.dart';
import 'package:socailmedia/features/comments/domain/usecase/usecase_fetch_comments_for_post.dart';

class CommentManager extends BaseManager
    with InputCommentManager, OutputComment {
  final UsecaseAddCommant usecaseAddCommant;
  final UsecaseFetchCommentsForPost usecaseFetchCommentsForPost;

  CommentManager({
    required this.usecaseAddCommant,
    required this.usecaseFetchCommentsForPost,
  });

  final StreamController _streamControllerComment =
      StreamController.broadcast();

  final StreamController _streamControllerFetchComments =
      BehaviorSubject<List<CommentData>>();

  @override
  strat() {}

  fetchCommentsForPost({
    required String postId,
  }) async {
    inputState.add(LoadingState(
        stateRenderType: StateRenderType.FULL_SCREEN_LOADING_STATE,
        message: StringsManager.loading));
    (await usecaseFetchCommentsForPost.call(FetchParams(postId: postId))).fold(
      (failure) {
        inputState.add(
          ErrorState(
            stateRenderType: StateRenderType.FULL_SCREEN_ERROR_STATE,
            message: failure.message,
          ),
        );
      },
      (commentData) {
        inputState.add(ContentState());
        inputFetchComments.add(commentData.data);
      },
    );
  }

  addComment({
    required String postID,
    required String comment,
  }) async {
    inputState.add(
      LoadingState(
        stateRenderType: StateRenderType.FULL_SCREEN_LOADING_STATE,
        message: StringsManager.loading,
      ),
    );
    (await usecaseAddCommant.call(
      CommnetParams(postID: postID, comment: comment),
    ))
        .fold((failure) {
      inputState.add(
        ErrorState(
          stateRenderType: StateRenderType.POPUP_ERROR_STATE,
          message: failure.message,
        ),
      );
    }, (addComment) {
      inputState.add(ContentState());
      inputAddComment.add(addComment);
      fetchCommentsForPost(postId: postID);
    });
  }

  @override
  dispose() {
    _streamControllerComment.close();
    _streamControllerFetchComments.close();
  }

  @override
  Sink get inputAddComment => _streamControllerComment.sink;

  @override
  Sink get inputFetchComments => _streamControllerFetchComments.sink;

  @override
  Stream<AddCommentEntities> get outputAddComment =>
      _streamControllerComment.stream.map((comment) => comment);

  @override
  Stream<List<CommentData>> get outputFetchComments =>
      _streamControllerFetchComments.stream.map((comments) => comments);
}

abstract class InputCommentManager {
  Sink get inputAddComment;
  Sink get inputFetchComments;
}

abstract class OutputComment {
  Stream<AddCommentEntities> get outputAddComment;
  Stream<List<CommentData>> get outputFetchComments;
}
