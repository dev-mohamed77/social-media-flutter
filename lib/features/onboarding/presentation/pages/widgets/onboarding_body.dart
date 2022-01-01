import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socailmedia/core/componants/floating_button.dart';
import 'package:socailmedia/features/auth/persintation/pages/login/login_screen.dart';
import 'package:socailmedia/features/onboarding/data/model/onboarding_model.dart';
import 'package:socailmedia/features/onboarding/presentation/manager/cubit/onboarding_cubit.dart';
import 'package:socailmedia/features/onboarding/presentation/pages/widgets/onboarding_item.dart';

class OnBoardingBody extends StatelessWidget {
  final PageController controller = PageController();
  OnBoardingBody({Key? key}) : super(key: key);
  void checkOnBoardingPages(BuildContext ctx) {
    if (OnboardingCubit.get(ctx).isNextPage) {
      Navigator.of(ctx).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        ),
      );
    } else {
      controller.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastLinearToSlowEaseIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnboardingCubit, OnboardingState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: controller,
                  onPageChanged: (index) {
                    if (index == 3) {
                      OnboardingCubit.get(context).isNextPage = true;
                    }
                  },
                  itemBuilder: (context, index) {
                    List allData = OnboardingCubit.get(context).data();
                    OnboardingModel data = allData[index];

                    return OnBoardingItem(
                      model: data,
                    );
                  },
                  itemCount: OnboardingCubit.get(context).data().length,
                ),
              ),
              Row(
                children: [
                  const Text("Smooth"),
                  const Spacer(),
                  FloatingButton(
                    onClick: () {
                      checkOnBoardingPages(context);
                    },
                    icon: Icons.arrow_forward_ios_outlined,
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
