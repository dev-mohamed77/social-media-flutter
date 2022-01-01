import 'package:dartz/dartz.dart';

import 'package:socailmedia/core/failure/failure.dart';
import 'package:socailmedia/core/information_device/information_device.dart';
import 'package:socailmedia/core/information_device/information_device_handler.dart';
import 'package:socailmedia/core/usecase/usecase.dart';
import 'package:socailmedia/features/home/data/model/posts_model.dart';
import 'package:socailmedia/features/home/domain/repositries/home_repo_domain.dart';

class UseCaseAddPost extends UseCase<PostsModel, ParamsPosts> {
  HomeRepositries repo;

  UseCaseAddPost({required this.repo});

  @override
  Future<Either<Failure, PostsModel>> call(ParamsPosts params) async {
    DeviceInformation device = await getDeviceInfo();

    return await repo.addPost(RequestPost(
      description: params.description,
      image: params.description,
      imie: device.identifier,
      platform: device.name,
    ));
  }
}

class ParamsPosts {
  String description;
  String image;
  ParamsPosts({
    required this.description,
    required this.image,
  });
}
