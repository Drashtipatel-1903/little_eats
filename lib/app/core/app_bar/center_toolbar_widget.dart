import '../../../utils/exports.dart';

class CenterAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String? title;
  final VoidCallback onBackButtonTap;
  final VoidCallback onCloseButtonTap;
  final bool isBackButtonVisible;
  final bool isCloseButtonVisible;
  final bool isTitleVisible;

  const CenterAppbarWidget({
    Key? key,
    this.title,
    this.isBackButtonVisible = true,
    this.isCloseButtonVisible = true,
    this.isTitleVisible = true,
    required this.onCloseButtonTap,
    required this.onBackButtonTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Back Button
          if (isBackButtonVisible)
            Positioned(
              left: 0,
              child: InkWell(
                onTap: onBackButtonTap,
                child: Padding(
                  padding: const EdgeInsets.all(Dimens.padding14),
                  child: Assets.svgs.icBack.svg(
                    height: Dimens.iconSize24,
                    width: Dimens.iconSize24,
                  ),
                ),
              ),
            ),

          // Close Button
          if (isCloseButtonVisible)
            Positioned(
              left: 0,
              child: InkWell(
                onTap: onCloseButtonTap,
                child: Assets.svgs.icClose.svg(
                  height: Dimens.iconSize24,
                  width: Dimens.iconSize24,
                ),
              ),
            ),

          // Centered Title
          if (isTitleVisible)
            Align(
              alignment: Alignment.center,
              child: CustomTextLabelWidget(
                textAlign: TextAlign.center,
                label: title ?? '',
                style: AppStyles.textTheme.titleLarge?.copyWith(
                    fontSize: Dimens.fontSize18,
                    color: AppColors.mainTextBlackColor,
                    fontWeight: FontWeight.w700),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
