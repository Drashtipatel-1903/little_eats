import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import '../../../../../../utils/exports.dart';

class CustomCalendarView extends StatelessWidget {
  final DateTime focusedDay;
  final DateTime? selectedDay;
  final Function(DateTime)? onDateSelected;

  const CustomCalendarView({
    Key? key,
    required this.focusedDay,
    this.selectedDay,
    this.onDateSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightBlueBGColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.now().subtract(const Duration(days: 365)),
            lastDay: DateTime.now().add(const Duration(days: 365)),
            focusedDay: DateTime.now(),
            selectedDayPredicate: (day) => isSameDay(selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              onDateSelected?.call(selectedDay);
            },
            calendarFormat: CalendarFormat.week,
            headerStyle: HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false,
                headerPadding: const EdgeInsets.symmetric(vertical: 8),
                headerMargin: const EdgeInsets.symmetric(vertical: 3),
                leftChevronMargin: const EdgeInsets.all(0),
                rightChevronMargin: const EdgeInsets.all(0),
                leftChevronPadding: const EdgeInsets.only(left: Dimens.padding16),
                rightChevronPadding: const EdgeInsets.only(right: Dimens.padding16),
                titleTextStyle: const TextStyle(
                  fontSize: Dimens.fontSize18,
                  fontWeight: FontWeight.bold,
                ),
                leftChevronIcon: Assets.png.icCalenderBack
                    .image(height: Dimens.iconSize24, width: Dimens.iconSize24),
                rightChevronIcon: Assets.png.icCalenderNext
                    .image(height: Dimens.iconSize24, width: Dimens.iconSize24)),

            calendarBuilders: CalendarBuilders(
              dowBuilder: (context, day) {
                final text = DateFormat.E().format(day).substring(0, 2);
                return Center(
                  child: Text(
                    text,
                    style: const TextStyle(
                        color: AppColors.subTextColor,
                        fontSize: Dimens.fontSize15,
                        fontWeight: FontWeight.w500),
                  ),
                );
              },
            ),

            // Calendar style customization
            calendarStyle: const CalendarStyle(
              isTodayHighlighted: true,
              selectedDecoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    Dimens.radius5,
                  ),
                ),
              ),
              todayDecoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    Dimens.radius5,
                  ),
                ),
              ),
              selectedTextStyle: TextStyle(
                color: AppColors.whiteTextColor,
                fontWeight: FontWeight.bold,
              ),
              cellMargin: EdgeInsets.all(10),
              cellPadding: const EdgeInsets.all(0),
              defaultTextStyle: TextStyle(
                color: AppColors.mainTextBlackColor,
                fontWeight: FontWeight.bold,
              ),
              weekendTextStyle: TextStyle(
                color: AppColors.mainTextBlackColor,
                fontWeight: FontWeight.bold,
              ),
            ),

            daysOfWeekStyle: const DaysOfWeekStyle(
              weekdayStyle: TextStyle(
                color: AppColors.subTextColor,
                fontSize: Dimens.fontSize14,
              ),
              weekendStyle: TextStyle(
                color: AppColors.subTextColor,
                fontSize: Dimens.fontSize14,
              ),
            ),

            startingDayOfWeek: StartingDayOfWeek.monday,
          ),
        ],
      ),
    );
  }
}

