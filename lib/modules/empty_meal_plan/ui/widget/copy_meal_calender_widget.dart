import '../../../../../../utils/exports.dart';
import 'package:table_calendar/table_calendar.dart';

class CopyMealCalenderWidget extends StatelessWidget {
  final Function(DateTime) onDateSelected;
  final VoidCallback onCancel;
  final DateTime? selectedDay;

  const CopyMealCalenderWidget({
    Key? key,
    required this.onDateSelected,
    required this.onCancel,
    this.selectedDay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateTime today = DateTime.now();

    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TableCalendar(
            firstDay: DateTime.now().subtract(const Duration(days: 365)),
            lastDay: DateTime.now().add(const Duration(days: 365)),
            focusedDay: DateTime.now(),
            selectedDayPredicate: (day) {
              return isSameDay(selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (isSameDay(selectedDay, today)) {
                onDateSelected(selectedDay);
              }
            },
            headerStyle: HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false,
                headerPadding: const EdgeInsets.symmetric(vertical: 12),
                headerMargin: const EdgeInsets.symmetric(vertical: 3),
                leftChevronMargin: const EdgeInsets.all(0),
                rightChevronMargin: const EdgeInsets.all(0),
                leftChevronPadding:
                    const EdgeInsets.only(left: Dimens.padding16),
                rightChevronPadding:
                    const EdgeInsets.only(right: Dimens.padding16),
                titleTextStyle: const TextStyle(
                  fontSize: Dimens.fontSize18,
                  fontWeight: FontWeight.bold,
                ),
                leftChevronIcon: Assets.png.icCalenderBack
                    .image(height: Dimens.iconSize24, width: Dimens.iconSize24),
                rightChevronIcon: Assets.png.icCalenderNext.image(
                    height: Dimens.iconSize24, width: Dimens.iconSize24)),
            daysOfWeekHeight: Dimens.space40,
            calendarStyle: const CalendarStyle(
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
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(Dimens.padding16),
            child: Column(
              children: [
                CustomButtonWidget(
                  onClick: () {
                    if (Navigator.of(context).canPop()) {
                      Navigator.of(context).pop();
                    }
                    Navigator.pop(context);
                  },
                  text: context.appString.copyMealKey,
                  textStyle: context.textTheme.titleMedium?.copyWith(
                    color: AppColors.whiteTextColor,
                    fontSize: Dimens.fontSize16,
                  ),
                ),
                const SizedBox(height: Dimens.space8),
                CustomOutlineButton(
                  title: context.appString.cancelKey,
                  onTap: () {
                    if (Navigator.of(context).canPop()) {
                      Navigator.of(context).pop();
                    }
                    Navigator.pop(context);
                  },
                  titleTextStyle: context.textTheme.titleMedium?.copyWith(
                    fontSize: Dimens.fontSize16,
                    color: AppColors.blueColor,
                  ),
                  titleColor: AppColors.blueColor,
                  borderWidth: Dimens.borderWidth1,
                  contentPadding: const EdgeInsets.all(Dimens.padding16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
