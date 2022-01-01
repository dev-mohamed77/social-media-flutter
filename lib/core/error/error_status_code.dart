class ErrorRemoteData {
  static const int success = 200;
  static const int create = 201;
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int notFound = 404;
  static const int noContent = 204;
  static const int badRequest = 400;
  static const int requestTimeOut = 408;
  static const int internalServerError = 500;
  static const int connectTimeOut = -1;
  static const int cancel = -2;
  static const int receiverTimeOut = -3;
  static const int sentTimeOut = -4;
  static const int noInternet = -5;
}

class ErrorLocalData {
  static const int unknown = -6;
  static const int cacheError = -7;
}
