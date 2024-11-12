import '../../../../utils/exports.dart';
import 'calender_model.dart';

class CalenderWeekItemView extends StatelessWidget {
  const CalenderWeekItemView(
      {super.key,
      required this.index,
      required this.onDateSelected,
      required this.calenderModel});

  final int index;
  final Function(String) onDateSelected;
  final List<CalenderModel> calenderModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (calenderModel[index].isEnable ?? true) {
          onDateSelected.call(calenderModel[index].weekDayDate ?? '');
        }else{
          displaySnackBar("You can not select future Dates", context);
        }
      },
      child: Container(
        margin: EdgeInsets.only(
            left: index != 0 ? Dimens.padding8 : Dimens.padding0),
        padding: const EdgeInsets.symmetric(
          vertical: Dimens.padding4,
          horizontal: Dimens.padding8,
        ),
        height: Dimens.space50,
        width: MediaQuery.of(context).size.width / Dimens.ratio9,
        decoration: BoxDecoration(
          borderRadius: Dimens.radius6.borderRadius,
          color: calenderModel[index].isSignedReport ?? false
              ? AppColors.primary
              : calenderModel[index].isSelected ?? false
                  ? AppColors.primary
                  : AppColors.primary,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextLabelWidget(
              label: calenderModel[index].date ?? '',
              maxLines: Dimens.maxLines01,
              style: AppStyles.textTheme.titleSmall?.copyWith(
                fontSize: Dimens.fontSize14,
                color: (calenderModel[index].isSignedReport == true ||
                        calenderModel[index].isSelected == true)
                    ? AppColors.primary
                    : AppColors.mainTextBlackColor,
              ),
            ),
            CustomTextLabelWidget(
              label: calenderModel[index].day ?? '',
              maxLines: Dimens.maxLines01,
              style: AppStyles.textTheme.labelMedium?.copyWith(
                fontSize: Dimens.fontSize14,
                color:  AppColors.whiteBGColor

              ),
            ),
          ],
        ),
      ),
    );
  }
}
