import '../../../../utils/exports.dart';

class SubscriptionHeaderWidget extends StatelessWidget {
  const SubscriptionHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              top: Dimens.padding50, left: Dimens.padding10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Assets.svgs.icClose.svg(
                  height: Dimens.iconSize24,
                  width: Dimens.iconSize24,
                  colorFilter: const ColorFilter.mode(
                      AppColors.whiteBGColor, BlendMode.srcIn)),
            ),
          ),
        ),
        Assets.svgs.icPremium.svg(
          height: Dimens.iconSize64,
          width: Dimens.iconSize64,
        ),
        const SizedBox(
          height: Dimens.space6,
        ),
        CustomTextLabelWidget(
          label: context.appString.getProKey,
          textAlign: TextAlign.center,
          style: context.textTheme.titleMedium?.copyWith(
              color: AppColors.mainTextBlackColor,
              fontWeight: FontWeight.w700,
              fontSize: Dimens.fontSize24),
        ),
        const SizedBox(
          height: Dimens.space6,
        ),
        CustomTextLabelWidget(
          label: context.appString.getProDescKey,
          textAlign: TextAlign.center,
          maxLines: Dimens.maxLines02,
          style: context.textTheme.titleMedium?.copyWith(
            color: AppColors.mainTextBlackColor,
            fontWeight: FontWeight.w600,
            fontSize: Dimens.fontSize16,
          ),
        ),
      ],
    );
  }
}
