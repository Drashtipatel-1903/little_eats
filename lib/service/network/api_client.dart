
import '../../utils/exports.dart';

/// Service of [ApiClient] (DIO).
///
/// Used to provide singleton instance of [ApiClient].
class ApiClient {
  Dio? _dio;
  String tag = "API call :";
  CancelToken? _cancelToken;
  static final ApiClient _instance = ApiClient._internal();

  factory ApiClient({bool isJson = false}) {
// mDio.options.headers['authorization'] = 'Bearer ';
// mDio.options.contentType = !isJson
// ? 'application/json'
// : 'application/x-www-form-urlencoded';

    return _instance;
  }

  ApiClient._internal() {
    _dio = initApiHandlerDio(configBaseUrl);
    _dio?.addSentry();
  }

  Dio initApiHandlerDio(String url) {
    _cancelToken = CancelToken();
    final baseOption = BaseOptions(
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
      baseUrl: url,
      contentType: 'application/json',
    );
    final mDio = Dio(baseOption);
    mDio.interceptors.add(HttpHandleInterceptor());
    if (kDebugMode) {
      mDio.interceptors.add(AwesomeDioInterceptor(
        logRequestHeaders: true,
        logResponseHeaders: true,
        logger: (log) => DebugLog.d(log),
      ));
    }
    return mDio;
  }

  void cancelRequests({CancelToken? cancelToken}) {
    cancelToken == null
        ? _cancelToken?.cancel('Cancelled')
        : cancelToken.cancel();
  }

  Future<ResponseHandler<T?>> handleApiCall<T>(
    String endUrl,
    ApiType apiType, {
    bool isB2cCall = false,
    Map<String, dynamic>? data,
    Map<String, dynamic>? params,
    Options? options,
    bool isMultipartFormData = false,
    CancelToken? cancelToken,
    bool showLoader = true,
    bool dismissLoader = true,
  }) async {
    late ResponseHandler<T?> handler;
    SentryService.instance.startAPITransaction(apiName: endUrl);
    try {
      _showLoading(showLoader);
      if (apiType == ApiType.get) {
        handler = await get<T>(
          endUrl,
          params: params,
          options: options,
          cancelToken: cancelToken,
        );
      } else if (apiType == ApiType.post) {
        handler = await post<T>(
          endUrl,
          data: data,
          params: params,
          options: options,
          cancelToken: cancelToken,
          isMultipartFormData: isMultipartFormData,
        );
      } else if (apiType == ApiType.delete) {
        handler = await delete<T>(
          endUrl,
          data: data,
          params: params,
          options: options,
          cancelToken: cancelToken,
        );
      }
      SentryService.instance.logSuccessAPITransaction(handler);
    } on FormatException {
      handler = OnFailureResponse(
        error: ErrorResult(
          errorMessage: MainConfig.context.appString.badRequestStateKey,
          type: DioExceptionType.unknown,
        ),
      );
    } on DioException catch (e) {
      SentryService.instance.logErrorAPITransaction(e);
      handler = _responseHandler<T>(Response(
          requestOptions: e.requestOptions,
          data: e.response?.data,
          statusCode: e.response?.statusCode,
          extra: {"error": e}));
    } finally {
      SentryService.instance.finishAPITransaction();
    }
    _dismissLoading(dismissLoader);
    return handler;
  }

  FutureOr<ResponseHandler<T?>> get<T>(
    String endUrl, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return _responseHandler<T>(await _dio?.get<T>(
      endUrl,
      queryParameters: params,
      cancelToken: cancelToken ?? _cancelToken,
      options: options,
    ));
  }

  FutureOr<ResponseHandler<T?>> post<T>(
    String endUrl, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
    bool isMultipartFormData = false,
  }) async {
    return _responseHandler<T>(await _dio?.post<T>(
      endUrl,
      data: isMultipartFormData ? FormData.fromMap(data!) : data,
      queryParameters: params,
      cancelToken: cancelToken ?? _cancelToken,
      options: options,
    ));
  }

  FutureOr<ResponseHandler<T?>> delete<T>(
    String endUrl, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return _responseHandler<T>(await _dio?.delete<T>(
      endUrl,
      data: data,
      queryParameters: params,
      cancelToken: cancelToken ?? _cancelToken,
      options: options,
    ));
  }

  ResponseHandler<T?> _responseHandler<T>(Response<T>? response) {
    if (response?.statusCode == 200) {
      return OnSuccessResponse(response: response?.data);
    } else if (response?.statusCode == 401) {
      return OnFailureResponse(
        error: ErrorResult(
          errorMessage: MainConfig.context.appString.unauthorizedKey,
          type: DioExceptionType.unknown,
        ),
        statusCode: 401,
      );
    } else if (response?.statusCode == 500) {
      return OnFailureResponse(
        error: ErrorResult(
          errorMessage: MainConfig.context.appString.serverNotRespondKey,
          type: DioExceptionType.badResponse,
        ),
        statusCode: 500,
      );
    } else {
      return OnFailureResponse(
        error: ErrorResult(
          errorMessage: MainConfig.context.appString.somethingWentWrongKey,
          type: DioExceptionType.unknown,
        ),
      );
    }
  }

  ResponseHandler<T?> _errorHandler<T>(DioException error) {
    if (error.type == DioExceptionType.badResponse) {
      return OnSuccessResponse<T?>(response: error.response?.data);
    }
    return OnFailureResponse(error: ErrorResult.getErrorResult(error));
  }

  void _showLoading(bool showLoader) {
    if (showLoader) EasyLoading.show();
  }

  void _dismissLoading(bool dismissLoader) {
    if (dismissLoader) EasyLoading.dismiss(animation: true);
  }

  handleRefreshToken(
    String endUrl, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    var response = await _dio?.request(
      endUrl,
      data: data,
      queryParameters: params,
      cancelToken: cancelToken,
      options: options,
    );
    return response;
  }
}



/// Interceptor to intercept api request and response.
class HttpHandleInterceptor extends Interceptor {
  static bool isInternetDialogVisible = false;
  static bool is401InProgress = false;

  FutureOr<bool> _checkInternet() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  ///this method is used to check internet connection
  ///if internet is not available then it will show dialog
  ///to retry or cancel the api call
  ///if dialog is visible then it will reject the current api call
  Future<void> _checkInternetConnection(
      RequestOptions options, RequestInterceptorHandler handler) async {
    var isConnected = await _checkInternet();
    if (isInternetDialogVisible) {
      //reject current api call
      return handler.reject(DioException(
        requestOptions: options,
        error: MainConfig.context.appString.noInternetConnectionKey,
      ));
    } else {
      if (isConnected) {
        return handler.next(options);
      } else {
        EasyLoading.dismiss(animation: true);

if(!isInternetDialogVisible){
        ///retry dialog for not internet connection
        showCustomDialog(
          message: MainConfig.context.appString.noInternetConnectionDescriptionKey,
          title: MainConfig.context.appString.noInternetConnectionKey,
          okBtnTitle: MainConfig.context.appString.retryKey,
          isDialogHideOnClick: true,
          onOkClicked: () {
            isInternetDialogVisible = false;
            showLoader(value: true);
            _checkInternetConnection(options, handler);
          },
          cancelBtnTitle: MainConfig.context.appString.cancelKey,
          onCancelClicked: () {
            isInternetDialogVisible = false;
            //reject current api call
            handler.reject(DioException(
              requestOptions: options,
              error: MainConfig.context.appString.noInternetConnectionKey,
            ));
          },
        );
      }}
    }
  }

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    _checkInternetConnection(options, handler);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 && !is401InProgress) {
      is401InProgress = true;
      /*TODO :add you refresh token api call*/
      //add your api call code here
      /*TODO :after call complete resume current call using below code*/
      /*return handler.resolve(
          await MainConfig.apiClient .handleRefreshToken(
            err.requestOptions.path,
            params: err.requestOptions.queryParameters,
            options: Options(method: err.requestOptions.method),
            data: err.requestOptions.data,
            cancelToken: err.requestOptions.cancelToken,
          ));*/
      /*TODO :if you don't have api just need to redirect to login you can use below code*/
      SharedPref.clearData();
      MainConfig.context.router.popUntilRoot();
      is401InProgress = false;
    } else {
      return handler.next(err);
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }
}
