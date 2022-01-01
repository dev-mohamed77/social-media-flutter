import 'package:flutter/material.dart';
import 'package:socailmedia/core/utils/color_manager.dart';
import 'package:socailmedia/features/account/presentation/pages/widgets/account_body.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(30),
          child: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              color: ConfigColor.kgreyMigrateColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.search,
                  color: ConfigColor.kDarkColor,
                  size: 20,
                ),
                Text(
                  "Search",
                  style: TextStyle(
                    fontSize: 16,
                    color: ConfigColor.kDarkColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: const AccountBody(),
    );
  }
}
