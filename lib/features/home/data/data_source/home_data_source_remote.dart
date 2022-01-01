import 'package:socailmedia/core/failure/exception.dart';
import 'package:socailmedia/core/helper/dio_helper.dart';
import 'package:socailmedia/core/utils/constant.dart';
import 'package:socailmedia/features/home/data/model/add_like_and_remove.dart';
import 'package:socailmedia/features/home/data/model/posts_model.dart';
import 'package:socailmedia/features/home/data/model/stories_model.dart';

abstract class HomeDataSourceRemote {
  Future<PostsModel> fetchPost();
  Future<PostsModel> addPost({
    required String description,
    required String image,
  });
  Future<StoriesModel> fetchStory();
  Future<StoriesModel> addStory({
    required String text,
    required String image,
  });
  Future<AddLikeAndRemove> addLikedAndRemove({required String postID});
}

class HomeDataSourceRemoteImp extends HomeDataSourceRemote {
  @override
  Future<PostsModel> addPost({
    required String description,
    required String image,
  }) async {
    try {
      var response = await DioHelper.postData(
        url: "post/create",
        data: {
          "description": description,
          "image": image,
        },
        token: token,
      );

      return PostsModel.fromJson(response.data);
    } on NetworkException {
      throw NetworkException;
    }
  }

  @override
  Future<StoriesModel> addStory({
    required String text,
    required String image,
  }) async {
    try {
      var response = await DioHelper.postData(
        url: "stories/create",
        data: {
          "text": text,
          "image": image,
        },
        token: token,
      );

      return StoriesModel.fromJson(response.data);
    } on NetworkException {
      throw NetworkException;
    }
  }

  @override
  Future<PostsModel> fetchPost() async {
    try {
      var response = await DioHelper.fetchData(
        url: "post",
        token: token,
      );

      return PostsModel.fromJson(response.data);
    } on NetworkException {
      throw NetworkException;
    }
  }

  @override
  Future<StoriesModel> fetchStory() async {
    try {
      var response = await DioHelper.fetchData(
        url: "stories",
        token: token,
      );

      return StoriesModel.fromJson(response.data);
    } on NetworkException {
      throw NetworkException;
    }
  }

  @override
  Future<AddLikeAndRemove> addLikedAndRemove({required String postID}) async {
    var response = await DioHelper.putData(
      url: "post/$postID/likeAndUnlike",
      token: token,
    );
    return AddLikeAndRemove.fromJson(response.data);
  }
}
