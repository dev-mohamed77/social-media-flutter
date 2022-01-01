import 'package:socailmedia/core/failure/failure.dart';
import 'package:socailmedia/features/home/data/model/posts_model.dart';
import 'package:socailmedia/features/home/data/model/stories_model.dart';

abstract class HomeState {}

class InitialHomeState extends HomeState {}

class ChangePagesHomeState extends HomeState {}

// Posts
class HomeStateFetPostsLoading extends HomeState {}

class HomeStateFetchPostsLoaded extends HomeState {
  final List<Post> posts;
  HomeStateFetchPostsLoaded({
    required this.posts,
  });
}

class HomeStateFetchPostsError extends HomeState {
  final Failure failure;
  HomeStateFetchPostsError({
    required this.failure,
  });
}

// Stories
class HomeStateFetchStoriesLoading extends HomeState {}

class HomeStateFetchStoriesLoaded extends HomeState {
  final List<Story> stories;
  HomeStateFetchStoriesLoaded({
    required this.stories,
  });
}

class HomeStateFetchStoriesError extends HomeState {
  final Failure failure;
  HomeStateFetchStoriesError({
    required this.failure,
  });
}
