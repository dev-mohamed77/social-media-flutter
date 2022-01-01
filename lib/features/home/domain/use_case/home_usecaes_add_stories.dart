import 'package:dartz/dartz.dart';

import 'package:socailmedia/core/failure/failure.dart';
import 'package:socailmedia/core/information_device/information_device.dart';
import 'package:socailmedia/core/information_device/information_device_handler.dart';
import 'package:socailmedia/core/usecase/usecase.dart';
import 'package:socailmedia/features/home/data/model/stories_model.dart';
import 'package:socailmedia/features/home/domain/repositries/home_repo_domain.dart';

class UseCaseAddStories extends UseCase<StoriesModel, PararmsStories> {
  HomeRepositries repo;
  UseCaseAddStories({required this.repo});

  @override
  Future<Either<Failure, StoriesModel>> call(PararmsStories params) async {
    DeviceInformation device = await getDeviceInfo();

    return await repo.addStories(
      RequestStory(
        image: params.image,
        text: params.text,
        imie: device.identifier,
        platform: device.name,
      ),
    );
  }
}

class PararmsStories {
  String image;
  String text;
  PararmsStories({
    required this.image,
    required this.text,
  });
}
