import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socailmedia/features/account/presentation/pages/account_screen.dart';
import 'package:socailmedia/features/chats/presentation/pages/chats_screen.dart';
import 'package:socailmedia/features/home/domain/use_case/home_usecase_fetch_post.dart';
import 'package:socailmedia/features/home/domain/use_case/home_usecase_fetch_stories.dart';
import 'package:socailmedia/features/home/presintation/manager/cubit/home_state.dart';
import 'package:socailmedia/features/home/presintation/pages/widgets/home_body.dart';
import 'package:socailmedia/features/notifications/presentation/pages/notifications_screen.dart';

class HomeCubit extends Cubit<HomeState> {
  final UseCaseFetchPost repoPosts;
  final UseCaseFetchStories repoStories;

  HomeCubit({
    required this.repoPosts,
    required this.repoStories,
  }) : super(InitialHomeState());

  static HomeCubit get(context) => BlocProvider.of(context);

  List<Widget> pages = [
    const HomeBody(),
    const ChatsScreen(),
    const NotificationsScreen(),
    const AccountScreen(),
  ];

  int currentPages = 0;

  void changePages(int index) {
    currentPages = index;

    emit(ChangePagesHomeState());
  }

  // GET Post
  // void fetchPost() async {
  //   emit(HomeStateFetPostsLoading());
  //   (await repoPosts.call(NoParams())).fold(
  //     (failure) {
  //       emit(HomeStateFetchPostsError(failure: failure));
  //     },
  //     (data) {
  //       emit(HomeStateFetchPostsLoaded(posts: data));
  //     },
  //   );
  // }

  // //

  // void fetchStories() async {
  //   emit(HomeStateFetchStoriesLoading());

  //   (await repoStories.call(NoParams())).fold(
  //     (failure) {
  //       emit(HomeStateFetchStoriesError(failure: failure));
  //     },
  //     (data) {
  //       emit(HomeStateFetchStoriesLoaded(stories: data));
  //     },
  //   );
  // }
}
