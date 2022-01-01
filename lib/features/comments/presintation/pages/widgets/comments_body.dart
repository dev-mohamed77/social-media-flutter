import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:socailmedia/core/base_manager/common/state_flow.dart';
import 'package:socailmedia/core/componants/text_feild.dart';
import 'package:socailmedia/core/utils/assets_manager.dart';
import 'package:socailmedia/core/utils/color_manager.dart';
import 'package:socailmedia/core/utils/strings_manager.dart';
import 'package:socailmedia/dependency_injection.dart';
import 'package:socailmedia/features/comments/domain/entities/comment_entities.dart';
import 'package:socailmedia/features/comments/domain/usecase/usecase_add_comment.dart';
import 'package:socailmedia/features/comments/domain/usecase/usecase_fetch_comments_for_post.dart';
import 'package:socailmedia/features/comments/presintation/comment_manager/comment_manager.dart';
import 'package:socailmedia/features/comments/presintation/pages/widgets/commetnts_item.dart';
import 'package:socailmedia/features/home/data/model/posts_model.dart';

class CommentsBody extends StatefulWidget {
  const CommentsBody({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  State<CommentsBody> createState() => _CommentsBodyState();
}

class _CommentsBodyState extends State<CommentsBody> {
  final CommentManager _commentManager = CommentManager(
    usecaseAddCommant: getIt<UsecaseAddCommant>(),
    usecaseFetchCommentsForPost: getIt<UsecaseFetchCommentsForPost>(),
  );

  bining() {
    _commentManager.fetchCommentsForPost(postId: widget.post.id!);
  }

  @override
  void initState() {
    bining();

    super.initState();
  }

  @override
  void dispose() {
    _commentManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return RefreshIndicator(
      onRefresh: () {
        return Future.delayed(const Duration(milliseconds: 500), () {});
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<FlowState>(
                stream: _commentManager.outputState,
                builder: (context, snapshot) {
                  return snapshot.data?.getScreenWidget(
                        context: context,
                        contentScreenWidget: StreamBuilder<List<CommentData>>(
                          stream: _commentManager.outputFetchComments,
                          builder: (context, snapShot) {
                            var data = snapShot.data;

                            if (snapShot.connectionState ==
                                ConnectionState.waiting) {
                              return Shimmer.fromColors(
                                baseColor: ConfigColor.kgreyColorShade300,
                                highlightColor: ConfigColor.kgreyColorShade100,
                                loop: 2,
                                child: const CommentShimmer(),
                              );
                            }

                            return Visibility(
                              visible: data!.isNotEmpty,
                              replacement: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Lottie.asset(
                                    AssetsManager.noCommentLottie,
                                    width: 70,
                                    height: 70,
                                    fit: BoxFit.cover,
                                  ),
                                  const Text(
                                    "No Comment yet ...",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                              child: ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return CommentsItem(
                                    comment: data[index],
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  height: 5,
                                ),
                                itemCount: data.length,
                              ),
                            );
                          },
                        ),
                        retryActionFunction: () {},
                      ) ??
                      Container();
                },
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              decoration: const BoxDecoration(
                color: ConfigColor.kWhiteColor,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: DefaultTextField(
                      controller: _controller,
                      hintText: StringsManager.addComment,
                      valid: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Some Text";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 55,
                    decoration:
                        const BoxDecoration(color: ConfigColor.kblueColor),
                    child: MaterialButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _commentManager.addComment(
                            postID: widget.post.id!,
                            comment: _controller.text,
                          );

                          _controller.clear();
                        }
                      },
                      child: const Icon(
                        Icons.send,
                        color: ConfigColor.kWhiteColor,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


// class CommentContent extends StatelessWidget {
//   CommentContent({
//     Key? key,
//     required this.post,
//     required this.commentManager,
//   }) : super(key: key);

//   final Post post;
//   final CommentManager commentManager;

//   final TextEditingController _controller = TextEditingController();

//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {}
// }
