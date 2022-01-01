import 'package:socailmedia/core/error/error_message.dart';
import 'package:socailmedia/core/error/error_status_code.dart';
import 'package:socailmedia/core/failure/failure.dart';

enum StatusCodeHandle {
  notFound,
  noContent,
  badRequest,
  requestTimeOut,
  internetServerError,
  unknown,
  connectTimeOut,
  cancel,
  receiverTimeOut,
  sentTimeOut,
  cacheError,
  noInternet,
  forbidden,
  unauthorized
}

extension Statuscodedata on StatusCodeHandle {
  Failure getFailure() {
    switch (this) {
      case StatusCodeHandle.notFound:
        return NetworkFailure(
          message: ErrorRemoteMessage.notFound,
          statusCode: ErrorRemoteData.notFound,
        );
      case StatusCodeHandle.noContent:
        return NetworkFailure(
          message: ErrorRemoteMessage.noContent,
          statusCode: ErrorRemoteData.noContent,
        );
      case StatusCodeHandle.badRequest:
        return NetworkFailure(
          message: ErrorRemoteMessage.badRequest,
          statusCode: ErrorRemoteData.badRequest,
        );
      case StatusCodeHandle.requestTimeOut:
        return NetworkFailure(
          message: ErrorRemoteMessage.requestTimeOut,
          statusCode: ErrorRemoteData.requestTimeOut,
        );
      case StatusCodeHandle.internetServerError:
        return NetworkFailure(
          message: ErrorRemoteMessage.internalServerError,
          statusCode: ErrorRemoteData.internalServerError,
        );
      case StatusCodeHandle.noInternet:
        return NetworkFailure(
          message: ErrorRemoteMessage.noInternet,
          statusCode: ErrorRemoteData.noInternet,
        );

      case StatusCodeHandle.unknown:
        return LocalFailure(
          message: ErrorLocalMessage.unknown,
          statusCode: ErrorLocalData.unknown,
        );
      case StatusCodeHandle.connectTimeOut:
        return NetworkFailure(
          message: ErrorRemoteMessage.connectTimeOut,
          statusCode: ErrorRemoteData.connectTimeOut,
        );
      case StatusCodeHandle.cancel:
        return NetworkFailure(
          message: ErrorRemoteMessage.cancel,
          statusCode: ErrorRemoteData.cancel,
        );
      case StatusCodeHandle.receiverTimeOut:
        return NetworkFailure(
          message: ErrorRemoteMessage.receiverTimeOut,
          statusCode: ErrorRemoteData.receiverTimeOut,
        );
      case StatusCodeHandle.sentTimeOut:
        return NetworkFailure(
          message: ErrorRemoteMessage.sentTimeOut,
          statusCode: ErrorRemoteData.sentTimeOut,
        );
      case StatusCodeHandle.cacheError:
        return LocalFailure(
          message: ErrorLocalMessage.cacheError,
          statusCode: ErrorLocalData.cacheError,
        );

      case StatusCodeHandle.forbidden:
        return NetworkFailure(
          message: ErrorRemoteMessage.forbidden,
          statusCode: ErrorRemoteData.forbidden,
        );
      case StatusCodeHandle.unauthorized:
        return NetworkFailure(
          message: ErrorRemoteMessage.unauthorized,
          statusCode: ErrorRemoteData.unauthorized,
        );
      default:
        return LocalFailure(
          message: ErrorLocalMessage.unknown,
          statusCode: ErrorLocalData.unknown,
        );
    }
  }
}
