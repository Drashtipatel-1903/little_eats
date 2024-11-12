import '../../../../utils/exports.dart';

class NewUserWidget extends StatelessWidget {
  const NewUserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(Dimens.padding16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: Dimens.space20),
            CenterAppbarWidget(
              isBackButtonVisible: false,
              onBackButtonTap: () {},
              onCloseButtonTap: () {
                Navigator.pop(context);
              },
              isTitleVisible: false,
            ),
            const SizedBox(height: Dimens.space6),
            const StepProgressIndicator(totalSteps: Dimens.totalSteps5),
            Expanded(
              flex: 1,
              child: BlocConsumer<NewUserQuestionnairesCubit,
                  NewUserQuestionnairesState>(
                listener: (context, state) {},
                builder: (context, state) {
                  switch (state.currentStep) {
                    case 1:
                      return const TellAboutBabyWidget();
                    case 2:
                      return const ChildAllergyWidget();
                    case 3:
                      return const ChildLikeDislikeWidget();
                    case 4:
                      return const StepFourWidget();
                    case 5:
                      return const StepFiveWidget();
                    default:
                      return const TellAboutBabyWidget();
                  }
                },
              ),
            ),
            const BottomButtonWidget(),
          ],
        ),
      ),
    );
  }
}
