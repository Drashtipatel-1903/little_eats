import '../../../../utils/exports.dart';

class OnBoardingPagerItemViewWidget extends StatelessWidget {
  final String title;
  final String description;
  final AssetGenImage assetImage;

  const OnBoardingPagerItemViewWidget({
    super.key,
    required this.title,
    required this.description,
    required this.assetImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        color: AppColors.lightBlueBGColor,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: Dimens.padding50,
                  left: Dimens.padding48,
                  right: Dimens.padding48),
              child: assetImage.image(),
            ),
            // Positioned curve at the bottom
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Assets.svgs.icCurve.svg(
                fit: BoxFit.fill,
                width: MediaQuery.sizeOf(context).width,
                height: Dimens.space160,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Material(
                  elevation: Dimens.elevation8,
                  shape: const CircleBorder(),
                  color: Colors.transparent,
                  child: Container(
                    padding: const EdgeInsets.all(Dimens.padding10),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.whiteBGColor,
                    ),
                    child: Assets.png.icLauncher.image(
                      height: Dimens.size100,
                      width: Dimens.size100,
                    ),
                  ),
                ),
                const SizedBox(height: Dimens.space10),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: Dimens.padding12),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: context.textTheme.titleLarge?.copyWith(
                      fontSize: Dimens.fontSize24,
                      color: AppColors.mainTextBlackColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(height: Dimens.space10),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: Dimens.padding22),
                  child: Text(
                    description,
                    textAlign: TextAlign.center,
                    style: context.textTheme.titleMedium?.copyWith(
                      fontSize: Dimens.fontSize14,
                      color: AppColors.subTextColor,
                      fontWeight: FontWeight.w400,
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
