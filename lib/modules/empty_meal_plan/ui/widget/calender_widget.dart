import '../../../../utils/exports.dart';

class CalenderWidget extends StatelessWidget {
  const CalenderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime focusedDay = DateTime.now();
    DateTime? selectedDay;

    return Container(
      height: Dimens.space140,
      color: AppColors.lightBlueBGColor,
      child: Column(
        children: [
          const SizedBox(
            height: Dimens.space16,
          ),
          CustomCalendarView(
            focusedDay: focusedDay,
            selectedDay: selectedDay,
            onDateSelected: (DateTime selected) {
              showModalBottomSheet(
                context: context,
                backgroundColor: AppColors.transparent,
                builder: (BuildContext context) {
                  return Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.transparent,
                          AppColors.colorBlack,
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.all(Dimens.space16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Assets.svgs.icPremium.svg(
                            width: Dimens.fontSize64,
                            height: Dimens.fontSize64),
                        const SizedBox(height: Dimens.space24),
                        CustomTextLabelWidget(
                          label: context.appString.planFutureMealDescKey,
                          textAlign: TextAlign.center,
                          style: context.textTheme.titleMedium?.copyWith(
                            color: AppColors.whiteTextColor,
                            fontSize: Dimens.fontSize20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: Dimens.space20),
                        CustomButtonWidget(
                          onClick: () {
                            Navigator.pop(context);
                          },
                          backgroundColor: AppColors.primary,
                          text: context.appString.getStartedForFreeKey,
                          textStyle: context.textTheme.titleMedium?.copyWith(
                            color: AppColors.whiteTextColor,
                            fontSize: Dimens.fontSize16,
                            fontWeight: FontWeight.w600,
                          ),
                          elevation: 0,
                        ),
                        const SizedBox(height: Dimens.space56),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
