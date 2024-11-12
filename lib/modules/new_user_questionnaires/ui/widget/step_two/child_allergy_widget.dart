import '../../../../../utils/exports.dart';

class ChildAllergyWidget extends StatelessWidget {
  const ChildAllergyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewUserQuestionnairesCubit(
        initialState: NewUserQuestionnairesState(
            animationJsonList: [],
            babyNameController: TextEditingController(),
            babyBirthdateController: TextEditingController(),
            emailController: TextEditingController(),
            fullNameController: TextEditingController(),
            passwordController: TextEditingController()),
      )..init(),
      child: Padding(
        padding: const EdgeInsets.only(
          top: Dimens.padding30,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextLabelWidget(
                label: context.appString.allergyHeadingKey,
                style: context.textTheme.titleMedium?.copyWith(
                  color: AppColors.mainTextBlackColor,
                  fontSize: Dimens.fontSize18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: Dimens.padding2),
              CustomTextLabelWidget(
                label: context.appString.allergyDescKey,
                textAlign: TextAlign.start,
                style: context.textTheme.titleSmall?.copyWith(
                  color: AppColors.subTextColor,
                  fontSize: Dimens.fontSize14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: Dimens.space40),
              const AllergyPreferenceWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
