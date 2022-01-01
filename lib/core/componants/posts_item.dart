import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:socailmedia/core/componants/default_icon_button.dart';
import 'package:socailmedia/core/utils/color_manager.dart';
import 'package:socailmedia/core/utils/strings_manager.dart';
import 'package:socailmedia/features/home/data/model/posts_model.dart';

class PostsItems extends StatelessWidget {
  PostsItems({
    Key? key,
    required this.post,
    required this.onClickLike,
    required this.onClickComment,
    required this.onClickShare,
    required this.iconColorLike,
    required this.textColorLike,
    required this.iconLike,
  }) : super(key: key);

  final Post post;
  final Color iconColorLike;
  final Color textColorLike;
  final IconData iconLike;
  final void Function()? onClickLike;
  final void Function()? onClickComment;
  final void Function()? onClickShare;

  final DateTime dateTimeNow = DateTime.now();

  //  DateTime timeParse = DateTime.parse(post.createdAt.toString());

  //                               int postTimeAndDate =
  //                                   dateTimeNow.difference(timeParse).inHours;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 55,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: ConfigColor.kWhiteColor,
                      backgroundImage: AssetImage("assets/images/posts/2.jpg"),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.userID?.username ?? StringsManager.empty,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "${55}",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 13,
                        color: ConfigColor.kgreyColor,
                      ),
                    )
                  ],
                ),
                const Spacer(),
                DefaultIconButton(
                  onClick: () {},
                  icon: Icons.more_horiz,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              post.description!,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Image.asset(
            "assets/images/posts/1.jpg",
            height: 230,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Text(
                "${post.likes?.length} Likes ",
                style: const TextStyle(
                  color: ConfigColor.kgreyColor,
                  fontSize: 13,
                ),
              ),
              Text(
                " ${post.comments?.length} comments .",
                style: const TextStyle(
                  color: ConfigColor.kgreyColor,
                  fontSize: 13,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "${7} Share",
                style: TextStyle(
                  color: ConfigColor.kgreyColor,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          const Divider(
            thickness: 2,
          ),
          Row(
            children: [
              LikeAndCommentAndShareButton(
                colorIcon: iconColorLike,
                icon: iconLike,
                onClick: onClickLike,
                text: 'Like',
                textColor: textColorLike,
              ),
              LikeAndCommentAndShareButton(
                icon: FontAwesomeIcons.comment,
                onClick: onClickComment,
                text: 'Comment',
              ),
              LikeAndCommentAndShareButton(
                icon: FontAwesomeIcons.share,
                onClick: onClickShare,
                text: 'Share',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LikeAndCommentAndShareButton extends StatelessWidget {
  const LikeAndCommentAndShareButton({
    Key? key,
    required this.onClick,
    required this.text,
    required this.icon,
    Color? colorIcon,
    Color? textColor,
  })  : _textColor = textColor ?? ConfigColor.kBlackColor,
        _colorIcon = colorIcon ?? ConfigColor.kgreyColor,
        super(key: key);

  final void Function()? onClick;
  final String text;
  final IconData icon;
  final Color _colorIcon;
  final Color _textColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onClick,
        child: SizedBox(
          height: 45,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: _colorIcon,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                text,
                style: TextStyle(fontSize: 15, color: _textColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShimmerPost extends StatelessWidget {
  const ShimmerPost({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 55,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: ConfigColor.kWhiteColor,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Container(
                  width: 60,
                  height: 10,
                  color: Colors.amber,
                ),
                const Spacer(),
                DefaultIconButton(
                  onClick: () {},
                  icon: Icons.more_horiz,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              width: double.infinity,
              height: 20,
              color: Colors.amberAccent,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            height: 180,
            color: Colors.amberAccent,
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
