import 'package:dartz/dartz.dart';

import 'package:socailmedia/core/failure/failure.dart';
import 'package:socailmedia/core/usecase/usecase.dart';
import 'package:socailmedia/features/home/data/model/add_like_and_remove.dart';
import 'package:socailmedia/features/home/domain/repositries/home_repo_domain.dart';

class UseCaseAddLikeAndRemove extends UseCase<AddLikeAndRemove, Params> {
  final HomeRepositries repo;

  UseCaseAddLikeAndRemove({
    required this.repo,
  });

  @override
  Future<Either<Failure, AddLikeAndRemove>> call(Params params) async {
    return await repo.addLikesAndRemove(postID: params.postID);
  }
}

class Params {
  final String postID;
  Params({
    required this.postID,
  });
}
