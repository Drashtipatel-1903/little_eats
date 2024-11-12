import '../../../../utils/exports.dart';

class MealPlanHeader extends StatelessWidget {
  const MealPlanHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.padding16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextLabelWidget(
            label: context.appString.mealPlansKey,
            style: context.textTheme.titleMedium?.copyWith(
                color: AppColors.mainTextBlackColor,
                fontSize: Dimens.fontSize18,
                fontWeight: FontWeight.w700),
          ),

          InkWell(
            onTap: () {
              context.router.pushNamed(AppPaths.subscription);
            },
            child: Assets.svgs.icPro.svg(),
          )

          /// TODO : in future if needed t0 implement
          /*Container(
            decoration: BoxDecoration(
              color: AppColors.proBGColor,
              borderRadius: BorderRadius.circular(Dimens.radius100),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Assets.svgs.icPremium.svg(),
                  const SizedBox(
                    width: Dimens.space4,
                  ),
                  CustomTextLabelWidget(
                    label: context.appString.proKey,
                    style: context.textTheme.titleMedium?.copyWith(
                        color: AppColors.whiteTextColor,
                        fontSize: Dimens.fontSize12,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ],
              ),
            ),
          )*/
        ],
      ),
    );
  }
}
