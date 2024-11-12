import '../../../../../utils/exports.dart';

class PersonalDetailsWidget extends StatelessWidget {
  const PersonalDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        const SizedBox(
          height: Dimens.space20,
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: Dimens.padding16, right: Dimens.padding16),
          child: CustomTextFormFieldWidget(
            controller: TextEditingController(),
            hint: context.appString.fullNameKey,
            label: context.appString.fullNameKey,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            floatingStyle: context.textTheme.titleMedium?.copyWith(
              color: AppColors.hintTextColor,
              fontSize: Dimens.fontSize16,
              fontWeight: FontWeight.w500,
            ),
            textInputType: TextInputType.text,
            input: TextInputAction.next,
            onChange: (value) {
              //newUserQuestionnairesCubit.checkIfFormIsFilled();
            },
          ),
        ),
        const SizedBox(
          height: Dimens.space24,
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: Dimens.padding16, right: Dimens.padding16),
          child: InkWell(
            onTap: () {},
            child: CustomTextFormFieldWidget(
              controller: TextEditingController(),
              hint: context.appString.emailKey,
              label: context.appString.emailKey,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              textInputType: TextInputType.text,
              input: TextInputAction.next,
              onTap: () {},
              isEditable: false,
              readOnly: false,
              suffixOnClick: () async {},
            ),
          ),
        ),
        const SizedBox(
          height: Dimens.space28,
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: Dimens.padding16, right: Dimens.padding16),
          child: CustomButtonWidget(
            text: context.appString.saveKey,
            textStyle: context.textTheme.titleMedium?.copyWith(
                color: AppColors.whiteTextColor,
                fontSize: Dimens.fontSize16,
                fontWeight: FontWeight.w600),
          ),
        )
      ],
    );
  }
}
