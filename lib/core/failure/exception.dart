import 'package:dio/dio.dart';
import 'package:socailmedia/core/error/error_handel.dart';
import 'package:socailmedia/core/error/error_status_code.dart';
import 'package:socailmedia/core/failure/failure.dart';

class NetworkException implements Exception {
  late Failure failure;
  NetworkException.handle(dynamic error) {
    if (error is DioError) {
      failure = _handelError(error);
    } else {
      failure = StatusCodeHandle.unknown.getFailure();
    }
  }
  Failure _handelError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
        return StatusCodeHandle.connectTimeOut.getFailure();
      case DioErrorType.sendTimeout:
        return StatusCodeHandle.sentTimeOut.getFailure();
      case DioErrorType.receiveTimeout:
        return StatusCodeHandle.receiverTimeOut.getFailure();

      case DioErrorType.response:
        switch (error.response?.statusCode) {
          case ErrorRemoteData.badRequest:
            return StatusCodeHandle.badRequest.getFailure();
          case ErrorRemoteData.forbidden:
            return StatusCodeHandle.forbidden.getFailure();
          case ErrorRemoteData.unauthorized:
            return StatusCodeHandle.unauthorized.getFailure();
          case ErrorRemoteData.notFound:
            return StatusCodeHandle.notFound.getFailure();
          case ErrorRemoteData.internalServerError:
            return StatusCodeHandle.internetServerError.getFailure();
          default:
            return StatusCodeHandle.unknown.getFailure();
          // return NetworkFailure(
          //   message: error.response!.data["message"],  // message from server backend
          //   statusCode: 12,
          // );
        }

      case DioErrorType.cancel:
        return StatusCodeHandle.cancel.getFailure();
      case DioErrorType.other:
        return StatusCodeHandle.unknown.getFailure();
    }
  }
}

class LocalException implements Exception {
  late Failure failure;
  LocalException();
  LocalException.handel(error) {
    if (error is LocalException) {
      failure = StatusCodeHandle.cacheError.getFailure();
    } else {
      failure = StatusCodeHandle.unknown.getFailure();
    }
  }
}
