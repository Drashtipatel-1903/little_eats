import '../../../../utils/exports.dart';

class MyProfileSettingListWidget extends StatelessWidget {
  const MyProfileSettingListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          right: Dimens.padding32, left: Dimens.padding32),
      child: Column(
        children: [
          const SizedBox(
            height: Dimens.space10,
          ),
          const NotificationViewWidget(),
          const SizedBox(
            height: Dimens.space12,
          ),
          const CustomDivider(
            height: Dimens.borderWidth1_5,
            color: AppColors.containerBorderColor,
          ),
          const SizedBox(
            height: Dimens.space16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextLabelWidget(
                label: context.appString.supportKey,
                style: context.textTheme.titleMedium?.copyWith(
                  color: AppColors.mainTextBlackColor,
                  fontSize: Dimens.fontSize15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: Dimens.padding6),
                child: Assets.svgs.icBackForward.svg(
                    colorFilter: const ColorFilter.mode(
                        AppColors.primary, BlendMode.srcIn)),
              )
            ],
          ),
          const SizedBox(
            height: Dimens.space16,
          ),
          const CustomDivider(
            height: Dimens.borderWidth1_5,
            color: AppColors.containerBorderColor,
          ),
          const SizedBox(
            height: Dimens.space16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextLabelWidget(
                label: context.appString.termsAndConditionKey,
                style: context.textTheme.titleMedium?.copyWith(
                  color: AppColors.mainTextBlackColor,
                  fontSize: Dimens.fontSize15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: Dimens.padding6),
                child: Assets.svgs.icBackForward.svg(
                    colorFilter: const ColorFilter.mode(
                        AppColors.primary, BlendMode.srcIn)),
              )
            ],
          ),
          const SizedBox(
            height: Dimens.space16,
          ),
          const CustomDivider(
            height: Dimens.borderWidth1_5,
            color: AppColors.containerBorderColor,
          ),
        ],
      ),
    );
  }
}
