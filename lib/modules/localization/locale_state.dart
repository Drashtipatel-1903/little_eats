import 'dart:ui';

import '../../app/enums/enums.dart';

class ChangeLocaleState {
  final BaseStateStatus status;
  final Locale locale;
  ChangeLocaleState(
    this.status, {
    required this.locale,
  });
}
