import 'package:sentry_flutter/sentry_flutter.dart';
import '../../utils/exports.dart';

class SentryService {
  SentryService._internal();

  static final SentryService instance = SentryService._internal();

  late ISentrySpan _span;
  late ISentrySpan _transaction;

  Future<void> init() async {
    await SentryFlutter.init(
      (options) {
        options.dsn = configSentryDSN;
        options.tracesSampleRate = 1.0;
        options.attachScreenshot = true;
        options.addIntegration(LoggingIntegration());
      },
    );
  }

  void startAPITransaction({required String apiName}) {
    // If there is no active transaction, start one
    _transaction = Sentry.startTransaction(
      apiName,
      'request',
      bindToScope: true,
    );
    //
    _transaction.setTag('user_id', AppConstant.sentryUserId);
    _span = _transaction.startChild(
      'dio',
      description: 'desc',
    );
  }

  void logSuccessAPITransaction<T>(ResponseHandler handler) async {
    if (handler.isSuccess()) {
      _transaction.setData(SentryConst.response, handler.getSuccessInstance()?.response);
    } else {
      _transaction.setData(SentryConst.response,
          jsonEncode(handler.getFailureInstance()?.error));
    }

    await _transaction.finish(status: const SpanStatus.ok());
    _span.status = const SpanStatus.ok();
  }

  void logErrorAPITransaction(Exception e) async {
    _span.throwable = e;
    _span.status = const SpanStatus.internalError();
  }

  Future<void> finishAPITransaction() async {
    await _span.finish();
    await _transaction.finish();
  }

  ///set config scope in sentry to help search event/exception by email and id
  void configScope({String? sentryUserId, String? sentryUserEmail}) {
    Sentry.configureScope(
      (scope) =>
          scope.setUser(SentryUser(id: sentryUserId, email: sentryUserEmail)),
    );
  }

  ///capture event in sentry
  void captureEvent(String event,
      {String? type,
      String tagKey = 'base_structure-tag',
      String tagValue = 'base_structure-event'}) {
    Sentry.captureEvent(
      SentryEvent(
        tags: {tagKey: tagValue},
        message: SentryMessage(event),
        level: SentryLevel
            .info, // Set the desired level (info, warning, error, etc.)
      ),
    );
  }

  /// Adds a breacrumb to the current Scope
  void addBreadcrumb(Breadcrumb crumb, {Hint? hint}) =>
      Sentry.addBreadcrumb(crumb, hint: hint);

  ///capture exception in sentry
  void captureException(dynamic exception,
      {dynamic stackTrace,
      String tagKey = 'base_structure-tag',
      String tagValue = 'base_structure-exception'}) {
    Sentry.captureException(
      exception,
      stackTrace: stackTrace,
      withScope: (scope) {
        scope.setTag(tagKey, tagValue);
        scope.level = SentryLevel.warning;
      },
    );
  }
}
