class AppError {
  int? code;
  String? description;

  AppError(this.code, this.description);

  static AppError internalError =
      AppError(ErrorCode.internalError, 'unexpected_error_try_again');
  static AppError noInternet = AppError(ErrorCode.noInternet, 'check_network');
  static AppError serverError =
      AppError(ErrorCode.serverError, 'server_communication_failed');
  static AppError notFound = AppError(ErrorCode.notFound, 'not_found');
  static AppError emptyData = AppError(ErrorCode.emptyData, 'empty data');
  static AppError gateWayIssue =
      AppError(ErrorCode.gateWayError, 'GATE way issue');

  @override
  String toString() {
    return 'AppError{code : $code, description : " $description "}';
  }
}

class ErrorCode {
  static const int internalError = -1;
  static const int noInternet = 100;
  static const int serverError = 101;
  static const int notFound = 404;
  static const int emptyData = 405;
  static const int gateWayError = 504;
}
