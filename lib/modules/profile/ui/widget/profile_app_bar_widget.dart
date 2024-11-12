import '../../../../../../utils/exports.dart';

class ProfileAppBarWidget extends StatelessWidget {
  const ProfileAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: Dimens.elevation1,
      child: Padding(
        padding: const EdgeInsets.only(
            left: Dimens.padding16,
            right: Dimens.padding16,
            top: Dimens.padding16,
            bottom: Dimens.padding8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Circular container for initials
            Container(
              padding: const EdgeInsets.all(Dimens.padding12),
              decoration: const BoxDecoration(
                color: AppColors.lightBlueBGColor,
                shape: BoxShape.circle,
              ),
              child: CustomTextLabelWidget(
                label: "JK",
                style: context.textTheme.titleMedium?.copyWith(
                    color: AppColors.primary,
                    fontSize: Dimens.fontSize20,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              width: Dimens.space24,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // Center vertically
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextLabelWidget(
                    label: context.appString.dummyName,
                    style: context.textTheme.titleMedium?.copyWith(
                        color: AppColors.mainTextBlackColor,
                        fontSize: Dimens.fontSize18,
                        fontWeight: FontWeight.w700),
                  ),
                  CustomTextLabelWidget(
                    label: context.appString.dummyEmail,
                    style: context.textTheme.titleMedium?.copyWith(
                        color: AppColors.subTextColor,
                        fontSize: Dimens.fontSize14,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            // Edit icon
            InkWell(
              onTap: () {
                context.router.push(EditProfileRoute());
              },
              child: Assets.svgs.icEdit
                  .svg(width: Dimens.iconSize28, height: Dimens.iconSize28),
            ),
          ],
        ),
      ),
    );
  }
}
