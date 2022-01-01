import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:socailmedia/core/utils/color_manager.dart';
import 'package:socailmedia/features/chats/presentation/pages/widgets/messages_body.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          onTap: () {},
          child: Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundColor: ConfigColor.kWhiteColor,
                backgroundImage: AssetImage("assets/images/posts/2.jpg"),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Mohamed Abdel Nasser",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: false,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ConfigColor.kBlackColor,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      "Activate 1 hour",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: false,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ConfigColor.kgreyColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.phone,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.video,
              size: 25,
            ),
          ),
        ],
      ),
      body: MessagesBody(),
    );
  }
}
