class ErrorRemoteMessage {
  static const String success = "Success";
  static const String create = "Create";
  static const String unauthorized = "unauthorized, please try again later";
  static const String forbidden = "forbidden, please try again later";
  static const String notFound = "Not Found, please try again later";
  static const String noContent =
      "Success with no content, please try again later";
  static const String badRequest = "Bad Request, please try again";
  static const String requestTimeOut =
      "Request timed out occurred, please try again";
  static const String internalServerError =
      "An error occurred in the internal server, please try again";
  static const String cancel = "Request was cancelled , try again later";
  static const String receiverTimeOut = "Time out error , try again later";
  static const String sentTimeOut = "Time out error , try again later";
  static const String connectTimeOut = "Time out error , try again later";
  static const String noInternet =
      "No internet, check your internet connection , try again later";
}

class ErrorLocalMessage {
  static const String unknown = "Some thing went wrong , try again later";
  static const String cacheError = "Cache error , try again later";
}
