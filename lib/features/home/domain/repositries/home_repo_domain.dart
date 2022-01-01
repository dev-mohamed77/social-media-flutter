import 'package:dartz/dartz.dart';

import 'package:socailmedia/core/failure/failure.dart';
import 'package:socailmedia/features/home/data/model/add_like_and_remove.dart';
import 'package:socailmedia/features/home/data/model/posts_model.dart';
import 'package:socailmedia/features/home/data/model/stories_model.dart';

abstract class HomeRepositries {
  Future<Either<Failure, List<Post>>> fetchPosts();
  Future<Either<Failure, PostsModel>> addPost(RequestPost requestPost);
  Future<Either<Failure, List<Story>>> fetchStories();
  Future<Either<Failure, StoriesModel>> addStories(RequestStory requestStory);
  Future<Either<Failure, AddLikeAndRemove>> addLikesAndRemove({
    required String postID,
  });
}

class RequestStory {
  String image;
  String text;
  String imie;
  String platform;

  RequestStory({
    required this.image,
    required this.text,
    required this.imie,
    required this.platform,
  });
}

class RequestPost {
  String description;
  String image;
  String imie;
  String platform;

  RequestPost({
    required this.description,
    required this.image,
    required this.imie,
    required this.platform,
  });
}
