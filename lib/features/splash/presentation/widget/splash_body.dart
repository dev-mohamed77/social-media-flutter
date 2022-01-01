import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:socailmedia/core/utils/constant.dart';
import 'package:socailmedia/features/auth/persintation/pages/login/login_screen.dart';
import 'package:socailmedia/features/home/presintation/pages/home_screen.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({Key? key}) : super(key: key);

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> with TickerProviderStateMixin {
  double _containerSize = 1.5;
  double _containerOpacity = 0.0;

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 1), () {
      setState(() {
        _containerSize = 2;
        _containerOpacity = 1;
      });
    });

    Timer(const Duration(seconds: 2), () {
      navigate();
    });
  }

  void navigate() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (_) => token != null ? const HomeScreen() : const LoginScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Center(
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 1000),
        opacity: _containerOpacity,
        curve: Curves.fastLinearToSlowEaseIn,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 2000),
          curve: Curves.fastLinearToSlowEaseIn,
          height: w / 3,
          width: w / _containerSize,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                "Social Medai",
                speed: const Duration(milliseconds: 150),
                textStyle: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
