import 'package:socailmedia/features/onboarding/domin/repositries/repository.dart';

class UseCase {
  final OnBoardingRepo repo;
  UseCase(this.repo);

  List fetchData() {
    return repo.fetchOnboardingData();
  }
}
