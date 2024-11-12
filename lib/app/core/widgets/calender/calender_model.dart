import 'day_info_model.dart';

class CalenderModel {
  String? date;
  String? day;
  bool? isEnable;
  bool? isSelected;
  bool? isSignedReport;
  String? weekDayDate;
  List<DateTime>? currentWeekDateList = [];
  List<DayDateInfo>? currentWeekList = [];

  CalenderModel(
      {this.date,
      this.day,
      this.isEnable,
      this.isSelected,
      this.weekDayDate,
      this.isSignedReport = false,
      this.currentWeekDateList,
      this.currentWeekList});

  CalenderModel copyWith({
    String? date,
    String? day,
    bool? isEnable,
    bool? isSelected,
    bool? isSignedReport,
    String? weekDayDate,
    List<DateTime>? currentWeekDateList,
    List<DayDateInfo>? currentWeekList,
  }) {
    return CalenderModel(
      date: date ?? this.date,
      day: day ?? this.day,
      isEnable: isEnable ?? this.isEnable,
      isSelected: isSelected ?? this.isSelected,
      isSignedReport: isSignedReport ?? this.isSignedReport,
      weekDayDate: weekDayDate ?? this.weekDayDate,
      currentWeekDateList: currentWeekDateList ?? this.currentWeekDateList,
      currentWeekList: currentWeekList ?? this.currentWeekList,
    );
  }
}
