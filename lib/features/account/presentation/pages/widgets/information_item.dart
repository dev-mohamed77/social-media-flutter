import 'package:flutter/material.dart';
import 'package:socailmedia/core/utils/color_manager.dart';

class InformationItem extends StatelessWidget {
  const InformationItem({
    Key? key,
    required this.icon,
    required this.textAnswer,
    required this.textInformation,
  }) : super(key: key);

  final IconData icon;
  final String textInformation;
  final String textAnswer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Icon(
            icon,
            size: 18,
            color: ConfigColor.kgreyColor,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            textInformation,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            textAnswer,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
