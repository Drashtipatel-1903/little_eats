import '../../../../../../utils/exports.dart';

class ProfileSubscriptionWidget extends StatelessWidget {
  const ProfileSubscriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.padding16),
      child: Container(
        padding: const EdgeInsets.all(Dimens.padding16),
        decoration: BoxDecoration(
          color: AppColors.proBGColor,
          borderRadius: BorderRadius.circular(Dimens.radius8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextLabelWidget(
              label: context.appString.yourSubscriptionKey,
              textAlign: TextAlign.start,
              style: context.textTheme.titleMedium?.copyWith(
                  color: AppColors.whiteTextColor,
                  fontSize: Dimens.fontSize20,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: Dimens.space12),
            Row(
              children: [
                Assets.svgs.icPremium
                    .svg(width: Dimens.iconSize46, height: Dimens.iconSize46),
                const SizedBox(width: Dimens.space12),
                Expanded(
                  child: CustomTextLabelWidget(
                    label: context.appString.yourSubscriptionDescKey,
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    style: context.textTheme.titleMedium?.copyWith(
                        color: AppColors.whiteTextColor,
                        fontSize: Dimens.fontSize15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    context.router.pushNamed(AppPaths.subscription);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: Dimens.padding16,
                      vertical: Dimens.padding8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Dimens.radius6),
                    ),
                  ),
                  child: CustomTextLabelWidget(
                    label: context.appString.subscribeKey,
                    style: context.textTheme.titleMedium?.copyWith(
                      color: AppColors.primary,
                      fontSize: Dimens.fontSize14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
