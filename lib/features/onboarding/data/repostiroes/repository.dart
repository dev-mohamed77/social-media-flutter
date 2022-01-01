import 'package:socailmedia/features/onboarding/domin/repositries/repository.dart';
import 'package:socailmedia/features/onboarding/data/model/onboarding_model.dart';

class DataRepo extends OnBoardingRepo {
  @override
  List<OnboardingModel> fetchOnboardingData() {
    List<OnboardingModel> data = [
      OnboardingModel(
        image: "assets/images/onboarding/1.svg",
        title: "Socail Medai 1",
        subTitle: "Socail Media SubTitle 1",
      ),
      OnboardingModel(
        image: "assets/images/onboarding/2.svg",
        title: "Socail Medai 2",
        subTitle: "Socail Media SubTitle 2",
      ),
      OnboardingModel(
        image: "assets/images/onboarding/3.svg",
        title: "Socail Medai 3",
        subTitle: "Socail Media SubTitle 3",
      ),
      OnboardingModel(
        image: "assets/images/onboarding/4.svg",
        title: "Socail Medai 4",
        subTitle: "Socail Media SubTitle 4",
      ),
    ];
    return data;
  }
}
