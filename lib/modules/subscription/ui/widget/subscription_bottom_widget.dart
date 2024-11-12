import '../../../../utils/exports.dart';

class SubscriptionBottomWidget extends StatelessWidget {
  const SubscriptionBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: Dimens.padding16, right: Dimens.padding16),
          child: CustomButtonWidget(
            text: context.appString.threeDayFreeTrialKey,
            textStyle: context.textTheme.titleMedium?.copyWith(
                color: AppColors.whiteTextColor,
                fontSize: Dimens.fontSize16,
                fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: Dimens.space8,
        ),
        CustomTextLabelWidget(
          label: context.appString.threeDayFreeTrialDescKey,
          style: context.textTheme.titleMedium?.copyWith(
            color: AppColors.mainTextBlackColor,
            fontWeight: FontWeight.w500,
            fontSize: Dimens.fontSize12,
          ),
        ),
        const SizedBox(
          height: Dimens.space40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomTextLabelWidget(
              label: context.appString.restorePurchaseKey,
              style: context.textTheme.titleMedium?.copyWith(
                  color: AppColors.mainTextBlackColor,
                  fontWeight: FontWeight.w400,
                  fontSize: Dimens.fontSize11,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.mainTextBlackColor),
            ),
            CustomTextLabelWidget(
              label: context.appString.termsOfUseKey,
              style: context.textTheme.titleMedium?.copyWith(
                  color: AppColors.mainTextBlackColor,
                  fontWeight: FontWeight.w400,
                  fontSize: Dimens.fontSize11,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.mainTextBlackColor),
            ),
            CustomTextLabelWidget(
              label: context.appString.privacyPolicyKey,
              style: context.textTheme.titleMedium?.copyWith(
                  color: AppColors.mainTextBlackColor,
                  fontWeight: FontWeight.w400,
                  fontSize: Dimens.fontSize11,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.mainTextBlackColor),
            ),
          ],
        ),
        const SizedBox(
          height: Dimens.space32,
        ),
      ],
    );
  }
}
