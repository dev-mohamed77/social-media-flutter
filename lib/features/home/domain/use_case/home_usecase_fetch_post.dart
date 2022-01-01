import 'package:socailmedia/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:socailmedia/core/usecase/usecase.dart';
import 'package:socailmedia/features/home/data/model/posts_model.dart';
import 'package:socailmedia/features/home/domain/repositries/home_repo_domain.dart';

class UseCaseFetchPost extends UseCase<List<Post>, NoParams> {
  HomeRepositries repo;

  UseCaseFetchPost({required this.repo});

  @override
  Future<Either<Failure, List<Post>>> call(NoParams params) async {
    return await repo.fetchPosts();
  }
}

class NoParams {}
