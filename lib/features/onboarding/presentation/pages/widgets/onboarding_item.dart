import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:socailmedia/features/onboarding/data/model/onboarding_model.dart';

class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem({Key? key, required this.model}) : super(key: key);
  final OnboardingModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          model.image,
          height: 400,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          model.title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          model.subTitle,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
