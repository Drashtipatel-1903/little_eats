import '../../../../utils/exports.dart';

class OnBoardingListItemWidget extends StatelessWidget {
  final String title;
  final String desc;
  final Image image;

  const OnBoardingListItemWidget(
      {required this.title,
      required this.desc,
      required this.image,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: Dimens.space36,
        ),
        image,
        const SizedBox(
          height: Dimens.space6,
        ),
        CustomTextLabelWidget(
          label: title,
          style: AppStyles.textTheme.headlineSmall?.copyWith(color: AppColors.mainTextBlackColor),
        ),
        const SizedBox(
          height: Dimens.space6,
        ),
        CustomTextLabelWidget(
          textAlign: TextAlign.center,
          label: desc,
          style: AppStyles.textTheme.labelSmall?.copyWith(color: AppColors.mainTextBlackColor, height: Dimens.lineHeight0),
        ),
      ],
    );
  }
}
