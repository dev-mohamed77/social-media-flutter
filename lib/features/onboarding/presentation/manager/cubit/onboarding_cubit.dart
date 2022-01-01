import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:socailmedia/features/onboarding/data/repostiroes/repository.dart';
import 'package:socailmedia/features/onboarding/domin/use_case/usecase.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());

  static OnboardingCubit get(context) => BlocProvider.of(context);

  List data() {
    emit(OnboardingStateData());
    return UseCase(DataRepo()).fetchData();
  }

  bool isNextPage = false;
}
