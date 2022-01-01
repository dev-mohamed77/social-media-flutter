// ignore_for_file: annotate_overrides, overridden_fields

abstract class Failure {
  int statusCode;
  String message;
  Failure({required this.message, required this.statusCode});
}

class NetworkFailure extends Failure {
  int statusCode;
  String message;
  NetworkFailure({required this.message, required this.statusCode})
      : super(statusCode: statusCode, message: message);
}

class LocalFailure extends Failure {
  int statusCode;
  String message;
  LocalFailure({required this.message, required this.statusCode})
      : super(statusCode: statusCode, message: message);
}
