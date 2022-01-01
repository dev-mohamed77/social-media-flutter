import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:socailmedia/core/componants/default_button.dart';
import 'package:socailmedia/core/utils/color_manager.dart';
import 'package:socailmedia/features/account/presentation/pages/widgets/follow_number_item.dart';
import 'package:socailmedia/features/account/presentation/pages/widgets/information_item.dart';

class AccountBody extends StatelessWidget {
  const AccountBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 255,
            width: double.infinity,
            child: Stack(
              children: [
                InkWell(
                  onTap: () {},
                  child: SizedBox(
                    width: double.infinity,
                    height: 185,
                    child: Image.asset(
                      "assets/images/posts/1.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Positioned(
                  bottom: 0,
                  right: 100,
                  left: 100,
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: ConfigColor.kWhiteColor,
                  ),
                ),
                const Positioned(
                  bottom: 10,
                  right: 130,
                  left: 130,
                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: ConfigColor.kWhiteColor,
                    backgroundImage: AssetImage(
                      "assets/images/posts/2.jpg",
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Text(
            "Mohamed Abdel Nasser",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Flutter Developer And Web Developer (Backend)",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 80,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(5),
                      child: const FollowNumberItem(
                        text: "Followers",
                        number: "50",
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(5),
                      child: const FollowNumberItem(
                        text: "Followings",
                        number: "70",
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(5),
                      child: const FollowNumberItem(
                        text: "Posts",
                        number: "20",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 52,
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: OutlinedButton(
                        onPressed: () {},
                        child: const Text(
                          "Edit Profile",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 52,
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: DefaultButton(
                        onClick: () async {},
                        text: "Add Post",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: DefaultButton(
                        onClick: () {},
                        text: "Add Story",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Divider(
            height: 2,
            thickness: 1,
          ),
          const SizedBox(
            height: 20,
          ),
          const InformationItem(
            icon: FontAwesomeIcons.home,
            textAnswer: "Egypt",
            textInformation: "Reside in",
          ),
          const SizedBox(
            height: 15,
          ),
          const InformationItem(
            icon: FontAwesomeIcons.locationArrow,
            textAnswer: "Sadat City",
            textInformation: "City",
          ),
          const SizedBox(
            height: 15,
          ),
          const InformationItem(
            icon: Icons.favorite,
            textAnswer: "Single",
            textInformation: "Relationship",
          ),
          const SizedBox(
            height: 15,
          ),
          const InformationItem(
            icon: FontAwesomeIcons.phone,
            textAnswer: "01208944100",
            textInformation: "Phone",
          ),
          const SizedBox(
            height: 15,
          ),
          const Divider(
            height: 2,
            thickness: 1,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 100,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Add Post",
                  style: TextStyle(
                    fontSize: 18.2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 55,
                            height: 55,
                            decoration:
                                const BoxDecoration(shape: BoxShape.circle),
                            child: Image.asset(
                              "assets/images/posts/2.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const Text(
                          "what are you thinking ?",
                          style: TextStyle(
                              fontSize: 18.2,
                              fontWeight: FontWeight.bold,
                              color: ConfigColor.kgreyColor),
                        )
                      ],
                    ),
                  ),
                ),
                const Divider(
                  thickness: 2,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container();
                // const PostsItems();
              },
              separatorBuilder: (context, index) {
                return Container(
                  height: 15,
                  width: double.infinity,
                  color: ConfigColor.kgreyMigrateColor,
                );
              },
              itemCount: 10,
            ),
          )
        ],
      ),
    );
  }
}
