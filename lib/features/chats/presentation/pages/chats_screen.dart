import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:socailmedia/core/utils/color_manager.dart';
import 'package:socailmedia/features/chats/presentation/pages/widgets/chats_body.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 45,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: ConfigColor.kgreyMigrateColor,
          ),
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 15,
                ),
                const Icon(
                  Icons.search,
                  size: 20,
                ),
                Text(
                  "Search",
                  style: TextStyle(
                      color: ConfigColor.kDarkColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: const ChatsBody(),
    );
  }
}
