import '../../../../utils/exports.dart';

class BottomButtonWidget extends StatelessWidget {
  const BottomButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final newUserQuestionnairesCubit =
        context.read<NewUserQuestionnairesCubit>();

    return BlocBuilder<NewUserQuestionnairesCubit, NewUserQuestionnairesState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Previous Button
            if (state.currentStep != 1)
              InkWell(
                onTap: newUserQuestionnairesCubit.navigateToPreviousStep,
                child: Container(
                  padding: const EdgeInsets.all(Dimens.padding14),
                  decoration: const BoxDecoration(
                    color: AppColors.lightGreyColor,
                    borderRadius:
                        BorderRadius.all(Radius.circular(Dimens.radius100)),
                  ),
                  child: Assets.svgs.icBack.svg(
                    colorFilter: const ColorFilter.mode(
                      AppColors.primary,
                      BlendMode.srcATop,
                    ),
                  ),
                ),
              ),
            const Spacer(),
            // Next/Submit Button
            InkWell(
              onTap: state.isNextButtonDisable
                  ? null
                  : () async {
                      if (state.currentStep == Dimens.step5) {
                        DebugLog.i("message");
                        await newUserQuestionnairesCubit
                            .signUpValidation(context);
                      } else {
                        newUserQuestionnairesCubit.navigateToNextStep();
                      }
                    },
              child: Container(
                width: state.currentStep == Dimens.step5
                    ? Dimens.space120
                    : Dimens.space110,
                padding: const EdgeInsets.all(Dimens.padding14),
                decoration: BoxDecoration(
                  color: state.isNextButtonDisable
                      ? AppColors.lightGreyColor
                      : AppColors.primary,
                  borderRadius:
                      const BorderRadius.all(Radius.circular(Dimens.radius30)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextLabelWidget(
                      label: state.currentStep == Dimens.step5
                          ? context.appString.submitKey
                          : context.appString.nextKey,
                      style: TextStyle(
                        color: state.isNextButtonDisable
                            ? AppColors.primary.withOpacity(0.6)
                            : AppColors.whiteBGColor,
                        fontWeight: FontWeight.w600,
                        fontSize: Dimens.fontSize16,
                      ),
                    ),
                    const SizedBox(width: Dimens.space10),
                    Assets.svgs.icBackForward.svg(
                      width: Dimens.iconSize18,
                      height: Dimens.iconSize18,
                      colorFilter: ColorFilter.mode(
                        state.isNextButtonDisable
                            ? AppColors.primary.withOpacity(0.6)
                            : AppColors.whiteBGColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
