import 'package:dio/dio.dart';
import 'package:socailmedia/core/error/error_handel.dart';
import 'package:socailmedia/core/failure/exception.dart';
import 'package:socailmedia/core/network/network_info.dart';
import 'package:socailmedia/features/home/data/data_source/home_data_source_remote.dart';
import 'package:socailmedia/features/home/data/data_source/home_data_source_cached.dart';
import 'package:socailmedia/features/home/data/model/add_like_and_remove.dart';
import 'package:socailmedia/features/home/data/model/stories_model.dart';
import 'package:socailmedia/features/home/data/model/posts_model.dart';
import 'package:socailmedia/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:socailmedia/features/home/domain/repositries/home_repo_domain.dart';

class HomeRepositriesImpl extends HomeRepositries {
  HomeDataSourceRemote homeDataSourceRemote;
  HomeDataSourceCache homeDataSourceCache;
  NetworkInfo networkInfo;
  HomeRepositriesImpl({
    required this.homeDataSourceRemote,
    required this.homeDataSourceCache,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, PostsModel>> addPost(RequestPost requestPost) async {
    if (await networkInfo.isConnected) {
      try {
        var postsModel = await homeDataSourceRemote.addPost(
          description: requestPost.description,
          image: requestPost.image,
        );

        if (postsModel.status) {
          return Right(postsModel);
        } else {
          return Left(
            NetworkFailure(message: postsModel.message!, statusCode: 20),
          );
        }
      } catch (err) {
        return left(NetworkException.handle(err).failure);
      }
    } else {
      return Left(StatusCodeHandle.noInternet.getFailure());
    }
  }

  @override
  Future<Either<Failure, StoriesModel>> addStories(
    RequestStory requestStory,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        var storiesModel = await homeDataSourceRemote.addStory(
          text: requestStory.text,
          image: requestStory.image,
        );
        if (storiesModel.status) {
          return Right(storiesModel);
        } else {
          return Left(
            NetworkFailure(message: "Not Found Stories", statusCode: 25),
          );
        }
      } catch (err) {
        return Left(NetworkException.handle(err).failure);
      }
    } else {
      return Left(StatusCodeHandle.noInternet.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<Post>>> fetchPosts() async {
    if (await networkInfo.isConnected) {
      try {
        var getPostModel = await homeDataSourceRemote.fetchPost();
        if (getPostModel.status) {
          homeDataSourceCache.cachedPosts(getPostModel);

          return Right(getPostModel.data);
        } else {
          return Left(StatusCodeHandle.unknown.getFailure());
        }
      } catch (err) {
        if (err is DioError) {}
        return Left(NetworkException.handle(err).failure);
      }
    } else {
      try {
        final localPosts = await homeDataSourceCache.getLastPosts();

        return Right(localPosts);
      } on LocalException {
        return Left(StatusCodeHandle.cacheError.getFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<Story>>> fetchStories() async {
    if (await networkInfo.isConnected) {
      try {
        var getStoryModel = await homeDataSourceRemote.fetchStory();
        if (getStoryModel.status) {
          homeDataSourceCache.cachedStories(getStoryModel);

          return Right(getStoryModel.data);
        } else {
          return Left(StatusCodeHandle.unknown.getFailure());
        }
      } catch (err) {
        return Left(NetworkException.handle(err).failure);
      }
    } else {
      try {
        final storyCache = await homeDataSourceCache.getLastStories();

        return Right(storyCache);
      } catch (err) {
        return Left(StatusCodeHandle.cacheError.getFailure());
      }
    }
  }

  @override
  Future<Either<Failure, AddLikeAndRemove>> addLikesAndRemove({
    required String postID,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        var data = await homeDataSourceRemote.addLikedAndRemove(postID: postID);

        if (data.status) {
          return Right(data);
        } else {
          return Left(StatusCodeHandle.unknown.getFailure());
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
