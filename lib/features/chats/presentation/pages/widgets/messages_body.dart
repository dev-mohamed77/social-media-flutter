import 'package:flutter/material.dart';
import 'package:socailmedia/core/utils/color_manager.dart';

class MessagesBody extends StatelessWidget {
  MessagesBody({Key? key}) : super(key: key);
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const CircleAvatar(
                radius: 15,
                backgroundColor: ConfigColor.kWhiteColor,
                backgroundImage: AssetImage("assets/images/posts/2.jpg"),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Container(
                        padding: const EdgeInsetsDirectional.all(11),
                        decoration: BoxDecoration(
                          color: ConfigColor.kblueColor.withOpacity(0.5),
                          borderRadius: const BorderRadiusDirectional.only(
                            bottomEnd: Radius.circular(30),
                            topEnd: Radius.circular(30),
                            topStart: Radius.circular(30),
                          ),
                        ),
                        child: const Text(
                          "Hello World",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      "8.30 PM",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Container(
                  padding: const EdgeInsetsDirectional.all(11),
                  decoration: BoxDecoration(
                    color: ConfigColor.kgreyColor.withOpacity(0.5),
                    borderRadius: const BorderRadiusDirectional.only(
                      bottomStart: Radius.circular(30),
                      topEnd: Radius.circular(30),
                      topStart: Radius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Hello World ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Text(
                "8.30 PM",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            height: 55,
            width: double.infinity,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              border: Border.all(
                color: ConfigColor.kgreyColor.withOpacity(0.5),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: " Type Something...",
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                    width: 70,
                    height: double.infinity,
                    color: ConfigColor.kblueColor,
                    child: MaterialButton(
                      onPressed: () {},
                      child: const Icon(
                        Icons.send,
                        color: ConfigColor.kWhiteColor,
                        size: 28,
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
