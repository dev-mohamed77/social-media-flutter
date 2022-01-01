import 'package:flutter/material.dart';
import 'package:socailmedia/features/comments/presintation/pages/widgets/comments_body.dart';
import 'package:socailmedia/features/home/data/model/posts_model.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CommentsBody(
        post: post,
      ),
    );
  }
}
