const _baseUrlKey = 'base_url';
const _androidAppId = 'androidAppId';
const _iosAppId = 'iosAppId';
const _webAppId = 'webAppId';
const _messagingSenderId = 'messagingSenderId';
const _projectId = 'projectId';
const _iosApiKey = 'iosApiKey';
const _androidApiKey = 'androidApiKey';
const _sentryDSNKey = 'sentryDSN';
const _envKey = 'envKey';
const _webApiKey = 'webApiKey';
const _authDomain = 'authDomain';
const _storageBucket = 'storageBucket';
const _measurementId = 'measurementId';
const _vapidKey = 'vapidKey';

String get configBaseUrl {
  return const String.fromEnvironment(_baseUrlKey, defaultValue: '');
}

String get configEnv {
  return const String.fromEnvironment(_envKey, defaultValue: '');
}

String get configAndroidAppId {
  return const String.fromEnvironment(_androidAppId, defaultValue: "");
}

String get configIosAppId {
  return const String.fromEnvironment(_iosAppId, defaultValue: "");
}

String get configWebAppId {
  return const String.fromEnvironment(_webAppId, defaultValue: "");
}

String get configSentryDSN {
  return const String.fromEnvironment(_sentryDSNKey, defaultValue: "");
}

String get configMessagingSenderId {
  return const String.fromEnvironment(_messagingSenderId, defaultValue: "");
}

String get configProjectId {
  return const String.fromEnvironment(_projectId, defaultValue: "");
}

String get configIOSApiKey {
  return const String.fromEnvironment(_iosApiKey, defaultValue: "");
}

String get configAndroidApiKey {
  return const String.fromEnvironment(_androidApiKey, defaultValue: "");
}

String get configWebApiKey {
  return const String.fromEnvironment(_webApiKey, defaultValue: "");
}

String get configAuthDomain {
  return const String.fromEnvironment(_authDomain, defaultValue: "");
}

String get configStorageBucket {
  return const String.fromEnvironment(_storageBucket, defaultValue: "");
}

String get configMeasurementId {
  return const String.fromEnvironment(_measurementId, defaultValue: "");
}

String get configVapidKey {
  return const String.fromEnvironment(_vapidKey, defaultValue: "");
}
