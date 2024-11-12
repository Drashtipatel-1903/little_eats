import '../../../../../utils/exports.dart';

class StepFiveWidget extends StatelessWidget {
  const StepFiveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          top: Dimens.padding30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextLabelWidget(
              label: context.appString.signupKey,
              style: context.textTheme.titleMedium?.copyWith(
                color: AppColors.mainTextBlackColor,
                fontSize: Dimens.fontSize18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: Dimens.padding2),
            CustomTextLabelWidget(
              label: context.appString.signupDescKey,
              style: context.textTheme.titleSmall?.copyWith(
                color: AppColors.subTextColor,
                fontSize: Dimens.fontSize14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: Dimens.space40),
            const StepFiveSignUpForm()
          ],
        ));
  }
}
