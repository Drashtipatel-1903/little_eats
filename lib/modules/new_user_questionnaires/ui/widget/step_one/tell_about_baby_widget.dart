import 'package:intl/intl.dart';
import '../../../../../utils/exports.dart';

class TellAboutBabyWidget extends StatelessWidget {
  const TellAboutBabyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final newUserQuestionnairesCubit =
        context.read<NewUserQuestionnairesCubit>();
    final focusNode = FocusNode();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: Dimens.padding30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextLabelWidget(
              label: context.appString.tellAboutBabyKey,
              style: context.textTheme.titleMedium?.copyWith(
                color: AppColors.mainTextBlackColor,
                fontSize: Dimens.fontSize18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: Dimens.padding2),
            CustomTextLabelWidget(
              label: context.appString.tellAboutBabyDescKey,
              style: context.textTheme.titleSmall?.copyWith(
                color: AppColors.subTextColor,
                fontSize: Dimens.fontSize14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: Dimens.space40),
            BlocBuilder<NewUserQuestionnairesCubit, NewUserQuestionnairesState>(
              builder: (context, state) {
                return CustomTextFormFieldWidget(
                  controller: state.babyNameController,
                  hint: context.appString.babyNameKey,
                  label: context.appString.babyNameKey,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  floatingStyle: context.textTheme.titleMedium?.copyWith(
                    color: AppColors.hintTextColor,
                    fontSize: Dimens.fontSize16,
                    fontWeight: FontWeight.w500,
                  ),
                  textInputType: TextInputType.text,
                  input: TextInputAction.next,
                  onChange: (value) {
                    newUserQuestionnairesCubit.checkIfFormIsFilled();
                  },
                );
              },
            ),
            const SizedBox(height: Dimens.space24),
            BlocBuilder<NewUserQuestionnairesCubit, NewUserQuestionnairesState>(
              builder: (context, state) {
                return InkWell(
                  onTap: () {
                    showCustomDatePicker(
                      context: context,
                      initialDate: state.fromDate,
                      firstDate: newUserQuestionnairesCubit.calculateDate(),
                      lastDate: DateTime.now(),
                      onDateSelected: (DateTime pickedDate) {
                        newUserQuestionnairesCubit.updateFromDate(pickedDate);

                        state.babyBirthdateController.text =
                            DateFormat(DateConstants.dateFormat)
                                .format(pickedDate);
                        focusNode.requestFocus();
                        newUserQuestionnairesCubit.checkIfFormIsFilled();
                      },
                    );
                  },
                  child: CustomTextFormFieldWidget(
                    controller: state.babyBirthdateController,
                    hint: context.appString.babyBirthdayKey,
                    label: context.appString.babyBirthdayKey,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    floatingStyle: context.textTheme.titleMedium?.copyWith(
                      color: AppColors.hintTextColor,
                      fontSize: Dimens.fontSize16,
                      fontWeight: FontWeight.w500,
                    ),
                    textInputType: TextInputType.text,
                    input: TextInputAction.next,
                    suffixIcon: Assets.svgs.icCalender,
                    onTap: () {},
                    isEditable: false,
                    readOnly: false,
                    suffixOnClick: () async {},
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Usage example:
void showCustomDatePicker({
  required BuildContext context,
  required DateTime initialDate,
  required DateTime firstDate,
  required DateTime lastDate,
  required Function(DateTime) onDateSelected,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CustomDatePicker(
        initialDate: initialDate,
        firstDate: firstDate,
        lastDate: lastDate,
        onDateSelected: onDateSelected,
      );
    },
  );
}
