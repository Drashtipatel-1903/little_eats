import 'package:intl/intl.dart';

import 'exports.dart';

class DateConstants {
  static const String dateTimeFormat = "yyyy-MM-dd HH:mm:ss";
  static const String yearMonthDayFormat = "yyyy-MM-dd";
  static const String dateMonthYearFormat = "dd-MMM-yyyy";
  static const String hours12WithMeridiemFormat = "hh:mm a";
  static const String timestampFormat = "yyyy-MM-ddTHH:mm:ss.SSS";
  static const String hour24Format = 'HH:mm';
  static const String dateFormat = 'MM/dd/yyyy';
  static const String dateDayMonthDateYear = 'EEEE, MMMM d, yyyy';

}

String getCurrentDateString(String dateFormat) {
  initializeDateFormatting();
  return DateFormat(dateFormat).format(DateTime.now()).toString();
}

String getUtcDate() {
  var dateUtc = DateTime.now().toUtc();
  var date = DateFormat(DateConstants.dateTimeFormat).format(dateUtc);
  return date;
}

String getLocalTime(String dateUtc, {String? format, bool isUtc = false}) {
  // convert it to local
  var dateTime =
      DateFormat(format ?? DateConstants.dateTimeFormat).parse(dateUtc, isUtc);
  var dateLocal = dateTime.toLocal();
  return DateFormat(DateConstants.hours12WithMeridiemFormat).format(dateLocal);
}

String dateToString(DateTime date,
    {String dateFormat = DateConstants.dateMonthYearFormat}) {
  return DateFormat(dateFormat).format(date);
}

DateTime stringToDate(String dateString,
    {String dateFormat = DateConstants.dateMonthYearFormat}) {
  try {
    return DateFormat(dateFormat).parse(dateString);
  } on Exception {
    return DateTime.now();
  }
}

String dateToISOString(DateTime date) {
  return DateFormat(DateConstants.timestampFormat).format(date);
}

// convert date from API response to app date format
String getConvertedDate(String dateString,
    {String dateFormat = DateConstants.dateMonthYearFormat}) {
  try {
    var dateTime = DateFormat(DateConstants.dateTimeFormat).parse(dateString);
    var formattedDate = DateFormat(dateFormat).format(dateTime.toLocal());
    return formattedDate;
  } on Exception {
    return "";
  }
}

// convert date from API response to app time format
String getConvertedTime(String dateString) {
  try {
    var dateTime = DateFormat(DateConstants.dateTimeFormat).parse(dateString);
    var formattedDate = DateFormat(DateConstants.hours12WithMeridiemFormat)
        .format(dateTime.toLocal());
    return formattedDate;
  } on Exception {
    return "";
  }
}

String convertedDateFormat(String dateString,
    {String fromThis = DateConstants.dateTimeFormat,
    String toThis = DateConstants.dateMonthYearFormat}) {
  var dateTime = DateFormat(fromThis).parse(dateString);
  var formattedDate = DateFormat(toThis).format(dateTime.toLocal());
  return formattedDate;
}

String parseDate(String dateUtc) {
  var date = DateFormat(DateConstants.dateTimeFormat).parse(dateUtc, true);
  var dateLocal = date.toLocal();
  var formattedDate =
      DateFormat(DateConstants.yearMonthDayFormat).format(dateLocal);
  var currentDate =
      DateFormat(DateConstants.yearMonthDayFormat).format(DateTime.now());
  if (formattedDate == currentDate) {
    return DateFormat(DateConstants.hours12WithMeridiemFormat)
        .format(dateLocal)
        .replaceAll(' ', '')
        .toLowerCase();
  }
  return DateFormat(DateConstants.dateMonthYearFormat).format(dateLocal);
}

List<DateTime> getDaysInBetween(DateTime startDate, DateTime endDate) {
  List<DateTime> days = [];
  for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
    days.add(startDate.add(Duration(days: i)));
  }
  return days;
}

String twoTimeDifference(String startTime, String endTime,
    {String? startTimeFormat = DateConstants.hours12WithMeridiemFormat,
    String? endTimeFormat = DateConstants.hours12WithMeridiemFormat,
    String? outputFormat = DateConstants.hour24Format}) {
  var sTime = stringToDate(startTime, dateFormat: startTimeFormat!);
  var eTime = stringToDate(endTime, dateFormat: endTimeFormat!);
  var difference = eTime.difference(sTime);
  return DateFormat(outputFormat!)
      .format(DateTime(0, 0, 0, 0, difference.inMinutes));
}
