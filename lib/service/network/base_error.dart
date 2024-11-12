import '../../utils/exports.dart';

class ErrorResult {
  String errorMessage;
  DioExceptionType type;
  int? statusCode = -1;
  bool isRetry;

  ErrorResult({
    required this.errorMessage,
    required this.type,
    this.isRetry = false,
    this.statusCode,
  });

  factory ErrorResult.getErrorResult(dynamic exception) {
    if (exception is DioException) {
      switch (exception.type) {
        case DioExceptionType.cancel:
          return ErrorResult(
            errorMessage: AppString.of(MainConfig.context).cancelKey,
            type: DioExceptionType.cancel,
          );

        case DioExceptionType.connectionTimeout:
          return ErrorResult(
            errorMessage:
                AppString.of(MainConfig.context).somethingWentWrongKey,
            type: DioExceptionType.connectionTimeout,
          );
        case DioExceptionType.sendTimeout:
          return ErrorResult(
            errorMessage:
                AppString.of(MainConfig.context).somethingWentWrongKey,
            type: DioExceptionType.sendTimeout,
          );
        case DioExceptionType.receiveTimeout:
          return ErrorResult(
            errorMessage:
                AppString.of(MainConfig.context).somethingWentWrongKey,
            type: DioExceptionType.receiveTimeout,
          );
        case DioExceptionType.badResponse:
          return ErrorResult(
            errorMessage:
                AppString.of(MainConfig.context).problemWithRequestKey,
            type: DioExceptionType.badResponse,
          );

        case DioExceptionType.unknown:
          return ErrorResult(
            errorMessage:
                AppString.of(MainConfig.context).somethingWentWrongKey,
            type: DioExceptionType.connectionError,
          );
        default:
          return ErrorResult(
              errorMessage: exception.message ??
                  AppString.of(MainConfig.context).somethingWentWrongKey,
              type: DioExceptionType.unknown);
      }
    } else {
      return ErrorResult(
        errorMessage: exception.message ??
            AppString.of(MainConfig.context).somethingWentWrongKey,
        type: DioExceptionType.unknown,
      );
    }
  }
}
