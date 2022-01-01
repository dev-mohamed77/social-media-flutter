import 'package:flutter/material.dart';
import 'package:socailmedia/core/utils/color_manager.dart';

class StoriesItems extends StatelessWidget {
  const StoriesItems({
    Key? key,
    required this.username,
    required this.image,
    required this.userImage,
  }) : super(key: key);

  final String username;
  final String image;
  final String userImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 90,
      alignment: Alignment.center,
      child: Stack(
        children: [
          Container(
            height: 130,
            width: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 7, top: 7),
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(userImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 95,
            child: SizedBox(
              width: 90,
              height: 60,
              child: Text(
                username,
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: const TextStyle(
                  fontSize: 12.3,
                  fontWeight: FontWeight.bold,
                  color: ConfigColor.kWhiteColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
