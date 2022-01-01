import 'package:dio/dio.dart';
import 'package:socailmedia/core/error/error_handel.dart';
import 'package:socailmedia/core/failure/exception.dart';
import 'package:socailmedia/core/failure/failure.dart';
import 'package:socailmedia/core/network/network_info.dart';
import 'package:socailmedia/core/utils/constant.dart';
import 'package:socailmedia/features/auth/data/data_source/auth_cach_data_source.dart';
import 'package:socailmedia/features/auth/data/data_source/auth_remote_data_source_login.dart';
import 'package:socailmedia/features/auth/data/model/login_model.dart';
import 'package:socailmedia/features/auth/data/model/register_model.dart';
import 'package:dartz/dartz.dart';
import 'package:socailmedia/features/auth/domin/repository/auth_domain_repo.dart';

// typedef Future<AuthEntities> _GetAuthRemoteData();

class AuthDataRepositoriesImp implements AuthDomainRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthCachedDataSource authCachedDataSource;
  final NetworkInfo networkInfo;
  AuthDataRepositoriesImp({
    required this.authRemoteDataSource,
    required this.networkInfo,
    required this.authCachedDataSource,
  });

  @override
  Future<Either<Failure, LoginModel>> login({
    required RequestLogin requestLogin,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        var datasource = await authRemoteDataSource.login(
          username: requestLogin.username,
          password: requestLogin.password,
        );

        if (datasource.status!) {
          authCachedDataSource.cachedTokenThenLogin(datasource);

          token = await authCachedDataSource.getLastTokenThenlogin();
          return Right(datasource);
        } else {
          return Left(
            NetworkFailure(message: datasource.message!, statusCode: 1),
          );
        }
      } catch (err) {
        return Left(NetworkException.handle(err).failure);
      }
    } else {
      return Left(
        StatusCodeHandle.noInternet.getFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, RegisterModel>> register({
    required RequestRegister requestRegister,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        var datasource = await authRemoteDataSource.register(
          username: requestRegister.username,
          password: requestRegister.password,
          email: requestRegister.email,
          phone: requestRegister.phone,
        );

        if (datasource.status!) {
          return Right(datasource);
        } else {
          return Left(
            NetworkFailure(message: datasource.message!, statusCode: 1),
          );
        }
      } catch (err) {
        // condition on username and email and phone is exsit
        if (err is DioError) {
          if (err.type == DioErrorType.response) {
            if (err.response?.statusCode == 500) {
              if (err.response?.data["message"].contains("username")) {
                return Left(
                  NetworkFailure(
                    message:
                        "The username is already in the database, please enter another username",
                    statusCode: -10,
                  ),
                );
              } else if (err.response?.data["message"].contains("email")) {
                return Left(
                  NetworkFailure(
                    message:
                        "The email is already in the database, please enter another email",
                    statusCode: -15,
                  ),
                );
              } else if (err.response?.data["message"].contains("phone")) {
                return Left(
                  NetworkFailure(
                    message:
                        "The phone is already in the database, please enter another phone",
                    statusCode: -20,
                  ),
                );
              }
            }
          }
        }
        // Gobale Error
        return Left(NetworkException.handle(err).failure);
      }
    } else {
      return Left(
        StatusCodeHandle.noInternet.getFailure(),
      );
    }
  }

  // Future<Either<Failure, AuthEntities>> _getData(
  //   _GetAuthRemoteData? getDataLoginOrRegister,
  // ) async {
  //   if (await networkInfo.isConnected) {
  //     try {
  //       var datasource = await getDataLoginOrRegister!();
  //       return Right(datasource);
  //     } on NetworkException {
  //       return Left(NetworkFailure());
  //     }
  //   } else {
  //     return Left(NetworkFailure());
  //   }
  // }
}
