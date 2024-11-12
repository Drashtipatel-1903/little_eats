import '../../../../utils/exports.dart';

class SubscriptionTermsWidget extends StatelessWidget {
  const SubscriptionTermsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.padding16),
      child: Column(
        children: [
          Row(
            children: [
              Assets.svgs.icBullet.svg(
                height: Dimens.iconSize16,
                width: Dimens.iconSize16,
              ),
              const SizedBox(
                width: Dimens.space10,
              ),
              CustomTextLabelWidget(
                label: context.appString.getProTermOneKey,
                textAlign: TextAlign.center,
                style: context.textTheme.titleMedium?.copyWith(
                    color: AppColors.mainTextBlackColor,
                    fontWeight: FontWeight.w400,
                    fontSize: Dimens.fontSize15),
              ),
            ],
          ),
          const SizedBox(
            height: Dimens.space16,
          ),
          Row(
            children: [
              Assets.svgs.icBullet.svg(
                height: Dimens.iconSize16,
                width: Dimens.iconSize16,
              ),
              const SizedBox(
                width: Dimens.space10,
              ),
              CustomTextLabelWidget(
                label: context.appString.getProTermTwoKey,
                textAlign: TextAlign.center,
                style: context.textTheme.titleMedium?.copyWith(
                    color: AppColors.mainTextBlackColor,
                    fontWeight: FontWeight.w400,
                    fontSize: Dimens.fontSize15),
              ),
            ],
          ),
          const SizedBox(
            height: Dimens.space16,
          ),
          Row(
            children: [
              Assets.svgs.icBullet.svg(
                height: Dimens.iconSize16,
                width: Dimens.iconSize16,
              ),
              const SizedBox(
                width: Dimens.space10,
              ),
              CustomTextLabelWidget(
                label: context.appString.getProTermThreeKey,
                textAlign: TextAlign.center,
                style: context.textTheme.titleMedium?.copyWith(
                    color: AppColors.mainTextBlackColor,
                    fontWeight: FontWeight.w400,
                    fontSize: Dimens.fontSize15),
              ),
            ],
          )
        ],
      ),
    );
  }
}
