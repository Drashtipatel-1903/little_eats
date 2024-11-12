import '../../../../../utils/exports.dart';

class FoodWidget extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final String? makingTime;
  final String? foodImage;
  final String? addIcon;
  final String? dotIcon;
  final bool? isDotIconVisible;
  final bool? isAddIconVisible;
  final bool? isTitleVisible;
  final bool? isFromHomeScreen;
  final bool? isMakingTimeVisible;
  final VoidCallback? onDotIconTap;
  final VoidCallback? onAddIconTap;

  const FoodWidget({
    super.key,
    this.title,
    this.subTitle,
    this.makingTime,
    this.foodImage,
    this.addIcon,
    this.dotIcon,
    this.onDotIconTap,
    this.onAddIconTap,
    this.isDotIconVisible = false,
    this.isAddIconVisible = false,
    this.isTitleVisible = false,
    this.isMakingTimeVisible = false,
    this.isFromHomeScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: Dimens.space10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (foodImage != null)
                Container(
                    padding: const EdgeInsets.all(Dimens.padding3),
                    width: Dimens.iconSize55,
                    height: Dimens.iconSize55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset(
                      foodImage!,
                      fit: BoxFit.cover,
                    )),
              const SizedBox(width: Dimens.space10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (isTitleVisible ?? false)
                      Text(
                        title ?? '',
                        style: context.textTheme.titleMedium?.copyWith(
                          color: AppColors.subTextColor,
                          fontSize: Dimens.fontSize11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    Text(
                      subTitle ?? '',
                      style: context.textTheme.titleMedium?.copyWith(
                        color: AppColors.mainTextBlackColor,
                        fontSize: Dimens.fontSize15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    if (makingTime != null && (isMakingTimeVisible ?? false))
                      Text(
                        makingTime ?? '',
                        style: context.textTheme.titleMedium?.copyWith(
                          color: AppColors.subTextColor,
                          fontSize: Dimens.fontSize14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                  ],
                ),
              ),
              if (isDotIconVisible ?? false)
                InkWell(
                  onTap: () {
                    if (onDotIconTap != null) {
                      onDotIconTap!();
                    }
                  },
                  child: Assets.svgs.icDots.svg(),
                ),
              if (isAddIconVisible ?? false)
                InkWell(
                  onTap: () {
                    if (onAddIconTap != null) {
                      onAddIconTap!();
                    }
                  },
                  child: Assets.svgs.icAdd.svg(),
                ),
            ],
          ),
          const SizedBox(
            height: Dimens.space6,
          ),
          CustomDivider(
            height: Dimens.borderWidth1_5,
            color: (isFromHomeScreen ?? false)
                ? AppColors.lightBlueColor
                : AppColors.containerBorderColor,
          ),
        ],
      ),
    );
  }
}
