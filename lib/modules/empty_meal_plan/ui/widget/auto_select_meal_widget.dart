import '../../../../utils/exports.dart';

class AutoSelectMealWidget extends StatelessWidget {
  const AutoSelectMealWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.padding16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextLabelWidget(
                label: context.appString.dummyDateKey,
                textAlign: TextAlign.start,
                style: context.textTheme.titleMedium?.copyWith(
                    color: AppColors.mainTextBlackColor,
                    fontSize: Dimens.fontSize18,
                    fontWeight: FontWeight.w700),
              ),
              CustomTextLabelWidget(
                label: context.appString.selectAutoMealPlanKey,
                style: context.textTheme.titleMedium?.copyWith(
                    color: AppColors.subTextColor,
                    fontSize: Dimens.fontSize15,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
          CustomSwitch(
            onChanged: (p0) {

            },
            switchValue: false,
          )
        ],
      ),
    );
  }
}
