import '../../../../../../utils/exports.dart';

class EditProfileViewWidget extends StatelessWidget {
  const EditProfileViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: Dimens.padding8),
          child: CustomTextLabelWidget(
            label: context.appString.myChildKey,
            style: context.textTheme.titleMedium?.copyWith(
              color: AppColors.mainTextBlackColor,
              fontSize: Dimens.fontSize15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(
          height: Dimens.space12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: const EdgeInsets.all(Dimens.padding3),
                decoration: const BoxDecoration(
                  color: AppColors.whiteBGColor,
                  shape: BoxShape.circle,
                ),
                child: Assets.svgs.icProfilePic
                    .svg(height: Dimens.iconSize48, width: Dimens.iconSize48)),
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
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  CustomTextLabelWidget(
                    label: context.appString.dummyDob,
                    style: context.textTheme.titleMedium?.copyWith(
                      color: AppColors.subTextColor,
                      fontSize: Dimens.fontSize12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            // Edit icon
            InkWell(
              onTap: () {
                context.router.push(const EditChildProfileRoute());
              },
              child: Assets.svgs.icEdit.svg(
                width: Dimens.iconSize24,
                height: Dimens.iconSize24,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: Dimens.space12,
        ),
        CustomTextLabelWidget(
          label: context.appString.childPreferenceKey,
          style: context.textTheme.titleMedium?.copyWith(
            color: AppColors.mainTextBlackColor,
            fontSize: Dimens.fontSize15,
            fontWeight: FontWeight.w700,
          ),
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: preferenceItem.length,
          separatorBuilder: (context, index) => const SizedBox(),
          itemBuilder: (context, index) {
            final item = preferenceItem[index];
            return PreferenceListWidget(
              title: item.title,
              forwardIcon: item.icon,
              onIconTap: () {
                if (index == 0) {
                  context.router.push(const ChildAllergyRoute());
                }
                if (index == 1) {
                  context.router.push(const LikeDislikeRoute());

                }
                if (index == 2) {
                  context.router.push(const MealPreferenceRoute());
                }
              },
            );
          },
        ),
      ],
    );
  }
}
