import '../../../../utils/exports.dart';

class CommonHeaderView extends StatelessWidget {

  const CommonHeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Assets.svgs.icLogo.svg(),
        const SizedBox(
          height: Dimens.space16,
        ),
        CustomTextLabelWidget(
          label: context.appString.loginDescKey,
          style: context.textTheme.titleMedium?.copyWith(
              color: AppColors.mainTextBlackColor,
              fontWeight: FontWeight.w500,
              fontSize: Dimens.fontSize16),
        ),
      ],
    );
  }
}
