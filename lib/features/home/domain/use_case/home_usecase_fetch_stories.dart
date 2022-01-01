import 'package:socailmedia/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:socailmedia/core/usecase/usecase.dart';
import 'package:socailmedia/features/home/data/model/stories_model.dart';
import 'package:socailmedia/features/home/domain/repositries/home_repo_domain.dart';

import 'home_usecase_fetch_post.dart';

class UseCaseFetchStories extends UseCase<List<Story>, NoParams> {
  HomeRepositries repo;

  UseCaseFetchStories({required this.repo});

  @override
  Future<Either<Failure, List<Story>>> call(NoParams params) async {
    return await repo.fetchStories();
  }
}
