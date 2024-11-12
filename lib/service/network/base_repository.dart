

import 'package:little_eats/service/network/response_handler.dart';

/// Base class for ApiRepositories.
///
/// Every repository class should must extend this class.
abstract class BaseRepository  {

  // final ApiClient apiClient = Get.find(tag: (ApiClient).toString());

  /// Generic Parser Function.
  ///
  /// This function will check for Success And Failure and parse the response
  /// in the Defined generic T type.
  ResponseHandler<T> getParsedResponseHandler<T>({
    required ResponseHandler<Map<String, dynamic>?> responseHandler,
    required T Function(Map<String, dynamic> value) parser,
  }) {
    if (responseHandler.isSuccess()) {
      final parsedData =
          parser.call(responseHandler.getSuccessInstance()?.response ?? {});
      return OnSuccessResponse<T>(response: parsedData);
    } else {
      return OnFailureResponse(
        statusCode: responseHandler.getFailureInstance()?.statusCode,
        error: responseHandler.getFailureInstance()?.error,
      );
    }
  }
}
