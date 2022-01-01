import 'package:flutter/material.dart';
import 'package:socailmedia/core/utils/color_manager.dart';
import 'package:socailmedia/features/onboarding/presentation/pages/widgets/onboarding_body.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConfigColor.kWhiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: OnBoardingBody(),
    );
  }
}
