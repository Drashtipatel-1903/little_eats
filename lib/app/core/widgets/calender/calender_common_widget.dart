import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../utils/exports.dart';
import 'calender_model.dart';
import 'calender_week_list_widget.dart';

class CalenderCommonWidget extends StatelessWidget {
  const CalenderCommonWidget({
    super.key,
    // required this.onActionTap,
    this.onDateSelected,
    this.calenderModel,
  });

  // final Function() onActionTap;
  final Function(String)? onDateSelected;
  final List<CalenderModel>? calenderModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimens.space140,
      padding: const EdgeInsets.symmetric(horizontal: Dimens.padding16),
      color: AppColors.lightBlueBGColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTextLabelWithIcon(
            onTap: () {
              DateTime today = DateTime.now();
              int firstDayOfWeek = today.weekday % Dimens.weekCount;
              today.subtract(Duration(days: firstDayOfWeek));

              showCustomDialog(
                message: "",
                customWidget: Container(
                  color: AppColors.whiteBGColor,
                  height: Dimens.space400,
                    child: SfDateRangePicker(
                      monthCellStyle: DateRangePickerMonthCellStyle(
                        todayTextStyle: TextStyle(
                          color: AppColors
                              .primary,
                        ),
                      ),
                      headerHeight: Dimens.space50,
                      headerStyle: DateRangePickerHeaderStyle(
                        backgroundColor: AppColors.whiteBGColor,
                        textAlign: TextAlign.center,
                        textStyle: AppStyles.textTheme.titleSmall?.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                      allowViewNavigation: true,
                      toggleDaySelection: true,
                      todayHighlightColor: AppColors.primary,
                      showTodayButton: false,
                      showActionButtons: true,
                      view: DateRangePickerView.month,
                      onSelectionChanged: (dateRangePickerSelectionChangedArgs) {},
                      onSubmit: (date) {
                        if (date != null) {
                          goBack(context);
                          //context.instance<CalenderBloc>().add(DateSelectedEvent(date as DateTime)); // Dispatch the event
                          //As of now we are not using it thatswhy we commented this, in future at time of merge we will remove
                          //context.instance<CalenderBloc>().add(CalenderDateSelectedAPICallEvent(date.toString()));
                        }
                      },
                      onCancel: () {
                        goBack(context);
                      },
                      backgroundColor: AppColors.whiteBGColor,
                      selectionTextStyle: AppStyles.textTheme.titleSmall?.copyWith(
                        color: AppColors.primary,
                        fontSize: Dimens.fontSize14,
                      ),
                      selectionColor: AppColors.primary,
                      selectionMode: DateRangePickerSelectionMode.single,
                      enablePastDates: true,
                      maxDate: DateTime.now(),
                    ),
                ),
              );
            },
            label: getCurrentDateString(DateConstants.dateDayMonthDateYear),
            // Adjust as needed
            iconPadding: const EdgeInsets.only(left: Dimens.padding8),
            imageColor: AppColors.whiteBGColor,
            isSuffix: true,
            style: AppStyles.textTheme.titleSmall?.copyWith(
              fontSize: Dimens.fontSize18,
              color: AppColors.mainTextBlackColor,
            ),
          ),

          const SizedBox(height: Dimens.space8),
          CalenderWeekWidget(
            calenderModel: [
              CalenderModel(
                day: "Mo",
                date: "1",
                currentWeekDateList: [],
                currentWeekList: [],
                isEnable: true,
                isSelected: true,
                isSignedReport: false,
                weekDayDate: "",
              ),
            ],
            onDateSelected: (String value) {
              onDateSelected?.call(value);
            },
          ),
          const SizedBox(height: Dimens.space4),
        ],
      ),
    );
  }
}
