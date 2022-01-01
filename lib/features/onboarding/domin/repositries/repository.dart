import 'package:socailmedia/features/onboarding/data/model/onboarding_model.dart';

abstract class OnBoardingRepo {
  List<OnboardingModel> fetchOnboardingData();
}
