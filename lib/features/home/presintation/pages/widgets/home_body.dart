import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:socailmedia/core/base_manager/common/state_flow.dart';
import 'package:socailmedia/core/componants/default_icon_button.dart';
import 'package:socailmedia/core/componants/posts_item.dart';
import 'package:socailmedia/core/utils/color_manager.dart';
import 'package:socailmedia/dependency_injection.dart';
import 'package:socailmedia/features/comments/presintation/pages/comment.dart';
import 'package:socailmedia/features/home/data/model/posts_model.dart';
import 'package:socailmedia/features/home/data/model/stories_model.dart';
import 'package:socailmedia/features/home/domain/use_case/home_usecase_add_like_and_remove.dart';
import 'package:socailmedia/features/home/domain/use_case/home_usecase_fetch_post.dart';
import 'package:socailmedia/features/home/domain/use_case/home_usecase_fetch_stories.dart';
import 'package:socailmedia/features/home/presintation/manager/home_manager.dart/home_manager.dart';
import 'package:socailmedia/features/home/presintation/pages/widgets/stories_items.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ConfigColor.kWhiteColor,
        title: Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage("assets/images/logo/logo.png"),
            ),
          ),
        ),
        actions: [
          DefaultIconButton(
            onClick: () {},
            icon: Icons.search,
          ),
          DefaultIconButton(
            onClick: () async {},
            icon: Icons.notifications,
          ),
          DefaultIconButton(
            onClick: () {},
            icon: FontAwesomeIcons.facebookMessenger,
          ),
        ],
      ),
      body: const PageBody(),
    );
  }
}

class PageBody extends StatefulWidget {
  const PageBody({
    Key? key,
  }) : super(key: key);

  @override
  State<PageBody> createState() => _PageBodyState();
}

class _PageBodyState extends State<PageBody> {
  final HomeManager _homeManager = HomeManager(
    useCaseFetchPostRepo: getIt<UseCaseFetchPost>(),
    useCaseFetchStoriesRepo: getIt<UseCaseFetchStories>(),
    useCaseAddLikeAndRemove: getIt<UseCaseAddLikeAndRemove>(),
  );

  @override
  void initState() {
    _binig();
    super.initState();
  }

  _binig() {
    _homeManager.strat();
  }

  @override
  void dispose() {
    _homeManager.dispose();
    super.dispose();
  }

  final DateTime dateTimeNow = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        return Future.delayed(
          const Duration(
            milliseconds: 500,
          ),
          () {
            _homeManager.strat();
          },
        );
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 75,
              decoration: const BoxDecoration(
                color: ConfigColor.kWhiteColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: Image.asset(
                          "assets/images/logo/logo.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          alignment: Alignment.centerLeft,
                          width: double.infinity,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: ConfigColor.kgreyColor,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Text(
                            "Add Post Now",
                            textAlign: TextAlign.start,
                            style: TextStyle(color: ConfigColor.kgreyColor),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              height: 140,
              width: double.infinity,
              child: StreamBuilder<FlowState>(
                stream: _homeManager.outputState,
                builder: (context, snapShot) {
                  var data = snapShot.data;
                  return data?.getScreenWidget(
                        context: context,
                        contentScreenWidget: StreamBuilder<List<Story>>(
                          stream: _homeManager.outputFetchStoriess,
                          builder: (context, snapShot) {
                            var _data = snapShot.data;
                            if (snapShot.connectionState ==
                                ConnectionState.waiting) {
                              return Shimmer.fromColors(
                                baseColor: ConfigColor.kgreyColorShade300,
                                highlightColor: ConfigColor.kgreyColorShade100,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return const StoriesItems(
                                      username: '@@@@@',
                                      image: "assets/images/posts/1.jpg",
                                      userImage: "assets/images/posts/2.jpg",
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(
                                      width: 0,
                                    );
                                  },
                                  itemCount: 7,
                                ),
                              );
                            }

                            return ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                var story = _data?[index];

                                return StoriesItems(
                                  image: "assets/images/posts/1.jpg",
                                  userImage: "assets/images/posts/2.jpg",
                                  username: "${story?.userID?.username}",
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  width: 10,
                                );
                              },
                              itemCount: _data!.length,
                            );
                          },
                        ),
                        retryActionFunction: () {
                          _homeManager.strat();
                        },
                      ) ??
                      Container();
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: StreamBuilder<FlowState>(
                stream: _homeManager.outputState,
                builder: (context, snapShot) {
                  var data = snapShot.data;
                  return data?.getScreenWidget(
                        context: context,
                        contentScreenWidget: StreamBuilder<List<Post>>(
                          stream: _homeManager.outPutFetchPosts,
                          builder: (context, snapShot) {
                            var _data = snapShot.data;
                            if (snapShot.connectionState ==
                                ConnectionState.waiting) {
                              return Shimmer.fromColors(
                                baseColor: ConfigColor.kgreyColorShade300,
                                highlightColor: ConfigColor.kgreyColorShade100,
                                loop: 2,
                                child: const ShimmerPost(),
                              );
                            }

                            return ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                Post? _post = _data?[index];

                                return PostsItems(
                                  post: _post!,
                                  onClickComment: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) => CommentsScreen(
                                          post: _post,
                                        ),
                                      ),
                                    );
                                  },
                                  onClickLike: () {
                                    _homeManager.addLikeAndRemove(_post.id!);
                                  },
                                  onClickShare: () {},
                                  iconColorLike: _post.islike!
                                      ? ConfigColor.redColor
                                      : ConfigColor.kgreyColor,
                                  iconLike: _post.islike!
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined,
                                  textColorLike: _post.islike!
                                      ? ConfigColor.redColor
                                      : ConfigColor.kgreyColor,
                                );
                              },
                              separatorBuilder: (context, index) {
                                return Container(
                                  height: 15,
                                  width: double.infinity,
                                  color: ConfigColor.kgreyMigrateColor,
                                );
                              },
                              itemCount: _data!.length,
                            );
                          },
                        ),
                        retryActionFunction: () {
                          _homeManager.strat();
                        },
                      ) ??
                      Container();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
