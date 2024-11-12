import '../../../../../utils/exports.dart';

class StepProgressIndicator extends StatelessWidget {
  final int totalSteps;

  const StepProgressIndicator({super.key, required this.totalSteps});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewUserQuestionnairesCubit, NewUserQuestionnairesState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(totalSteps, (index) {
                int currentStep = index + 1;
                Color stepColor = currentStep <= state.currentStep
                    ? (currentStep == state.currentStep
                        ? AppColors.primary
                        : AppColors.primary)
                    : AppColors.disableStepperColor;

                return SizedBox(
                  width: Dimens.iconSize68,
                  child: Container(
                    margin: const EdgeInsets.only(right: Dimens.padding8),
                    height: Dimens.size6,
                    decoration: BoxDecoration(
                      color: stepColor,
                    ),
                  ),
                );
              }),
            ),
          ],
        );
      },
    );
  }
}
