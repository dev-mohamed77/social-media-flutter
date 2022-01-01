// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socailmedia/core/failure/exception.dart';
import 'package:socailmedia/core/utils/constant.dart';
import 'package:socailmedia/features/home/data/model/posts_model.dart';
import 'package:socailmedia/features/home/data/model/stories_model.dart';

abstract class HomeDataSourceCache {
  Future<List<Story>> getLastStories();

  Future<bool> cachedStories(StoriesModel storiesModel);

  Future<List<Post>> getLastPosts();

  Future<bool> cachedPosts(PostsModel postsModel);
}

class HomeDataSourceCacheImp extends HomeDataSourceCache {
  final SharedPreferences sharedPreferences;

  HomeDataSourceCacheImp({required this.sharedPreferences});

  @override
  Future<List<Post>> getLastPosts() {
    final postsCached = sharedPreferences.getString(CACHED_POSTS);

    if (postsCached != null) {
      List data = json.decode(postsCached);
      print(data);

      var postList = List.from(data).map((e) => Post.fromJson(e)).toList();

      print(postList[0].userID!);

      return Future.value(postList);
    } else {
      throw LocalException();
    }
  }

  @override
  Future<List<Story>> getLastStories() {
    final storiesCached = sharedPreferences.getString(CACHED_STORIES);

    if (storiesCached != null) {
      var storyList = (json.decode(storiesCached) as List<dynamic>)
          .map<Story>((post) => Story.fromJson(post))
          .toList();

      print(storyList);

      return Future.value(storyList);
    } else {
      throw LocalException();
    }
  }

  @override
  Future<bool> cachedPosts(PostsModel postsModel) {
    Future<bool> sharedPosts = sharedPreferences.setString(
      CACHED_POSTS,
      json.encode(
        postsModel.data.map((post) => Post.toJson(post)).toList(),
      ),
    );
    return sharedPosts;
  }

  @override
  Future<bool> cachedStories(StoriesModel storiesModel) {
    Future<bool> sharedStories = sharedPreferences.setString(
      CACHED_STORIES,
      json.encode(
        storiesModel.data.map((story) => Story.toJson(story)).toList(),
      ),
    );
    return sharedStories;
  }
}
