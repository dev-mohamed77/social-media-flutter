import 'package:dartz/dartz.dart';
import 'package:socailmedia/core/failure/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
