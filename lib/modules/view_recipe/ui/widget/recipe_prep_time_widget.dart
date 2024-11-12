import '../../../../utils/exports.dart';

class RecipePrepTimeWidget extends StatelessWidget {
  const RecipePrepTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimens.padding16,
        right: Dimens.padding16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomTextLabelWidget(
            label: context.appString.goodOldPancakesKey,
            style: context.textTheme.titleMedium?.copyWith(
              color: AppColors.mainTextBlackColor,
              fontWeight: FontWeight.w700,
              fontSize: Dimens.fontSize18,
              decorationColor: AppColors.mainTextBlackColor,
            ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: Dimens.space16,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomTextLabelWidget(
                    label: context.appString.prepTimeKey,
                    style: context.textTheme.titleMedium?.copyWith(
                      color: AppColors.mainTextBlackColor,
                      fontWeight: FontWeight.w600,
                      fontSize: Dimens.fontSize16,
                      decorationColor: AppColors.mainTextBlackColor,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  CustomTextLabelWidget(
                    label: context.appString.totalCookingTimeKey,
                    style: context.textTheme.titleMedium?.copyWith(
                      color: AppColors.subTextColor,
                      fontWeight: FontWeight.w500,
                      fontSize: Dimens.fontSize14,
                      decorationColor: AppColors.mainTextBlackColor,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              const SizedBox(
                width: Dimens.space36,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomTextLabelWidget(
                    label: context.appString.cookTimeKey,
                    style: context.textTheme.titleMedium?.copyWith(
                      color: AppColors.mainTextBlackColor,
                      fontWeight: FontWeight.w600,
                      fontSize: Dimens.fontSize16,
                      decorationColor: AppColors.mainTextBlackColor,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  CustomTextLabelWidget(
                    label: context.appString.totalCookingTimeKey,
                    style: context.textTheme.titleMedium?.copyWith(
                      color: AppColors.subTextColor,
                      fontWeight: FontWeight.w500,
                      fontSize: Dimens.fontSize14,
                      decorationColor: AppColors.mainTextBlackColor,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
