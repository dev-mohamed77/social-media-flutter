import 'package:flutter/material.dart';
import 'package:socailmedia/core/utils/assets_manager.dart';
import 'package:socailmedia/core/utils/color_manager.dart';
import 'package:socailmedia/core/utils/padding_manager.dart';
import 'package:socailmedia/core/utils/strings_manager.dart';
import 'package:socailmedia/features/comments/domain/entities/comment_entities.dart';

class CommentsItem extends StatelessWidget {
  const CommentsItem({Key? key, required this.comment}) : super(key: key);

  final CommentData comment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(PaddingManager.p15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(AssetsManager.profile),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(PaddingManager.p5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: ConfigColor.kblueColor.withOpacity(0.2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Text(
                      comment.userID.username,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    comment.comment,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CommentShimmer extends StatelessWidget {
  const CommentShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(PaddingManager.p15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 25,
            backgroundColor: ConfigColor.kgreyColor,
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(PaddingManager.p5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: ConfigColor.kblueColor.withOpacity(0.2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 35,
                    height: 10,
                    color: ConfigColor.kblueColor,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: double.infinity,
                    height: 30,
                    color: ConfigColor.kblueColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
