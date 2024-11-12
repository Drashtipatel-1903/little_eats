import '../../../utils/exports.dart';

class AppbarWithTitleIcon extends StatelessWidget
    implements PreferredSizeWidget {
  final String? title;
  final VoidCallback onCloseButtonTap;
  final bool isCloseButtonVisible;
  final bool isTitleVisible;
  final ValueNotifier<bool>? isSearchVisibleNotifier;

  const AppbarWithTitleIcon({
    Key? key,
    this.title,
    this.isCloseButtonVisible = true,
    this.isTitleVisible = true,
    required this.onCloseButtonTap,
    this.isSearchVisibleNotifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isSearchVisibleNotifier ?? ValueNotifier(false),
      builder: (context, isSearchVisible, child) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: kToolbarHeight,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if (!isSearchVisible)
                    Positioned(
                      right: Dimens.padding0,
                      child: InkWell(
                        onTap: () {
                          isSearchVisibleNotifier?.value = true;
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(Dimens.padding16),
                          child: Assets.svgs.icSearch.svg(
                            height: Dimens.iconSize14,
                            width: Dimens.iconSize14,
                          ),
                        ),
                      ),
                    ),

                  // Close Button
                  if (isCloseButtonVisible)
                    Positioned(
                      left: Dimens.padding0,
                      child: InkWell(
                        onTap: () {
                          if (isSearchVisibleNotifier?.value ?? false) {
                            isSearchVisibleNotifier?.value =
                                false; // Hide search widget
                          } else {
                            onCloseButtonTap();
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(Dimens.padding16),
                          child: Assets.svgs.icClose.svg(
                            height: Dimens.iconSize24,
                            width: Dimens.iconSize24,
                          ),
                        ),
                      ),
                    ),
                  if (isTitleVisible)
                    Align(
                      alignment: Alignment.center,
                      child: CustomTextLabelWidget(
                        textAlign: TextAlign.center,
                        label: title ?? '',
                        style: AppStyles.textTheme.titleLarge?.copyWith(
                          fontSize: Dimens.fontSize18,
                          color: AppColors.mainTextBlackColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            if (isSearchVisible) const CommonSearchWidget(),
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
