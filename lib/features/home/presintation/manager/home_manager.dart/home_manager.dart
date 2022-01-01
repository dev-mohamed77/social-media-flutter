import 'dart:async';

import 'package:rxdart/subjects.dart';
import 'package:socailmedia/core/base_manager/base_manager.dart';
import 'package:socailmedia/core/base_manager/common/state_flow.dart';
import 'package:socailmedia/core/base_manager/common/state_render.dart';
import 'package:socailmedia/core/utils/strings_manager.dart';
import 'package:socailmedia/features/home/data/model/posts_model.dart';
import 'package:socailmedia/features/home/data/model/stories_model.dart';
import 'package:socailmedia/features/home/domain/use_case/home_usecase_add_like_and_remove.dart';
import 'package:socailmedia/features/home/domain/use_case/home_usecase_fetch_post.dart';
import 'package:socailmedia/features/home/domain/use_case/home_usecase_fetch_stories.dart';

class HomeManager extends BaseManager
    with HomeMnagerInputs, HomeManagerOutputs {
  final UseCaseAddLikeAndRemove useCaseAddLikeAndRemove;
  final UseCaseFetchPost useCaseFetchPostRepo;
  final UseCaseFetchStories useCaseFetchStoriesRepo;

  final StreamController _fetchPostStreamContriller =
      BehaviorSubject<List<Post>>();
  final StreamController _fetchStoriesStreamController =
      BehaviorSubject<List<Story>>();

  final StreamController _addLikeAndRemoveStreamController =
      BehaviorSubject<bool>();

  HomeManager({
    required this.useCaseFetchPostRepo,
    required this.useCaseFetchStoriesRepo,
    required this.useCaseAddLikeAndRemove,
  });

  @override
  dispose() {
    _fetchPostStreamContriller.close();
    _fetchStoriesStreamController.close();
    _addLikeAndRemoveStreamController.close();
  }

  @override
  strat() {
    _fetchPosts();
    _fetchStories();
  }

  _fetchPosts() async {
    inputState.add(LoadingState(
      stateRenderType: StateRenderType.FULL_SCREEN_LOADING_STATE,
      message: StringsManager.loading,
    ));
    (await useCaseFetchPostRepo.call(NoParams())).fold((failure) {
      inputState.add(
        ErrorState(
          stateRenderType: StateRenderType.FULL_SCREEN_ERROR_STATE,
          message: failure.message,
        ),
      );
    }, (postsData) {
      inputState.add(ContentState());
      inputFetchPost.add(postsData);
    });
  }

  _fetchStories() async {
    inputState.add(LoadingState(
      stateRenderType: StateRenderType.FULL_SCREEN_LOADING_STATE,
      message: StringsManager.loading,
    ));
    (await useCaseFetchStoriesRepo.call(NoParams())).fold((failure) {
      inputState.add(ErrorState(
        stateRenderType: StateRenderType.FULL_SCREEN_ERROR_STATE,
        message: failure.message,
      ));
    }, (storiesData) {
      inputState.add(ContentState());
      inputFetchStroies.add(storiesData);
    });
  }

  addLikeAndRemove(String postId) async {
    (await useCaseAddLikeAndRemove.call(Params(postID: postId))).fold(
      (failure) {
        inputState.add(
          ErrorState(
            stateRenderType: StateRenderType.POPUP_ERROR_STATE,
            message: failure.message,
          ),
        );
      },
      (data) {
        inputAddLikeAndRemove.add(data.data.isLike);
      },
    );
  }

  @override
  Sink get inputFetchPost => _fetchPostStreamContriller.sink;

  @override
  Sink get inputFetchStroies => _fetchStoriesStreamController.sink;

  @override
  Sink get inputAddLikeAndRemove => _addLikeAndRemoveStreamController.sink;

  @override
  Stream<List<Post>> get outPutFetchPosts =>
      _fetchPostStreamContriller.stream.map((post) => post);

  @override
  Stream<List<Story>> get outputFetchStoriess =>
      _fetchStoriesStreamController.stream.map((story) => story);

  @override
  Stream<bool> get outputAddLikeAndRemove =>
      _addLikeAndRemoveStreamController.stream.map((like) => like);
}

abstract class HomeMnagerInputs {
  Sink get inputFetchPost;
  Sink get inputFetchStroies;
  Sink get inputAddLikeAndRemove;
}

abstract class HomeManagerOutputs {
  Stream<List<Post>> get outPutFetchPosts;
  Stream<List<Story>> get outputFetchStoriess;
  Stream<bool> get outputAddLikeAndRemove;
}
