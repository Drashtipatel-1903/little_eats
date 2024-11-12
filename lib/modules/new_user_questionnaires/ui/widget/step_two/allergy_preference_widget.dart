import '../../../../../utils/exports.dart';

class AllergyPreferenceWidget extends StatelessWidget {
  const AllergyPreferenceWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<NewUserQuestionnairesCubit, NewUserQuestionnairesState>(
      builder: (context, state) {
        return ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.allergyOptions.length,
          itemBuilder: (context, index) {
            return CustomCheckBoxWidget(
              isChecked: state.allergyOptions[index].isSelected,
              title: state.allergyOptions[index].title,
              onCheck: (value) {
                context.read<NewUserQuestionnairesCubit>().updateAllergySelection(index);
              },
            );
          },
        );
      },
    );
  }
}
