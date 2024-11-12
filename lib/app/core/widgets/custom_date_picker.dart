import '../../../../utils/exports.dart';

class CustomDatePicker extends StatelessWidget {
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final Function(DateTime) onDateSelected;

  const CustomDatePicker({
    Key? key,
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
    required this.onDateSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(Dimens.radius12)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Custom header
          Container(
            padding: const EdgeInsets.all(Dimens.padding16),
            decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimens.radius12),
                topRight: Radius.circular(Dimens.radius12),
              ),
            ),
            child: Row(
              children: [
                Text(
                  context.appString.selectDateKey,
                  style: const TextStyle(
                    color: AppColors.whiteBGColor,
                    fontSize: Dimens.fontSize16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),

              ],
            ),
          ),
          // Calendar
          Container(
            constraints: const BoxConstraints(
              maxHeight: Dimens.space400,
            ),
            child: Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: AppColors.primary,
                  onPrimary: AppColors.whiteTextColor,
                  onSurface: Colors.black,
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.primary,
                  ),
                ),
              ),
              child: CalendarDatePicker(
                initialDate: initialDate,
                firstDate: firstDate,
                lastDate: lastDate,
                onDateChanged: (date) {
                  onDateSelected(date);
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
          // Bottom buttons
          Padding(
            padding: const EdgeInsets.all(Dimens.padding8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    context.appString.cancelKey,
                    style: const TextStyle(
                      color: AppColors.mainTextBlackColor,
                      fontSize: Dimens.fontSize14,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    onDateSelected(initialDate);
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    context.appString.okKey,
                    style: const TextStyle(
                      color: AppColors.mainTextBlackColor,
                      fontSize: Dimens.fontSize14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
