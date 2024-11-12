import '../../../../../utils/exports.dart';

class StepFiveSignUpForm extends StatelessWidget {
  const StepFiveSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final newUserQues = context.read<NewUserQuestionnairesCubit>();

    return BlocListener<NewUserQuestionnairesCubit, NewUserQuestionnairesState>(
      listener: (context, state) {
        if (state.status == BaseStateStatus.loading) {
          showLoader(value: true);
        } else {
          EasyLoading.dismiss();
        }

        if (state.status == BaseStateStatus.success) {
          context.router.pushNamed(AppPaths.dashboard);
        }

        if (state.status == BaseStateStatus.failure) {
          displaySnackBar("Signup failed. Please try again.", context);
        }
      },
      child: Form(
        key: newUserQues.formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Full Name Field
              _buildFormField(
                context: context,
                label: context.appString.fullNameKey,
                hint: context.appString.fullNameKey,
                controller: newUserQues.state.fullNameController,
                inputType: TextInputType.text,
                textInputAction: TextInputAction.next,
                onChange: newUserQues.fullNameChange,
                validator: (value) =>
                    value.toString().trim().validateFullName(context),
                buildWhen: (prev, curr) =>
                    prev.signupLocal.fullName != curr.signupLocal.fullName,
              ),
          
              const SizedBox(height: Dimens.space32),
          
              // Email Field
              _buildFormField(
                context: context,
                label: context.appString.emailKey,
                hint: context.appString.emailKey,
                controller: newUserQues.state.emailController,
                inputType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                onChange: newUserQues.emailChange,
                validator: (value) =>
                    value.toString().trim().validateEmail(context),
                buildWhen: (prev, curr) =>
                    prev.signupLocal.email != curr.signupLocal.email,
              ),
          
              const SizedBox(height: Dimens.space24),
          
              // Password Field
              BlocBuilder<NewUserQuestionnairesCubit, NewUserQuestionnairesState>(
                builder: (ctx, state) {
                  return CustomTextFormFieldWidget(
                    controller: state.passwordController,
                    hint: context.appString.passwordKey,
                    label: context.appString.passwordKey,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    floatingStyle: context.textTheme.titleMedium?.copyWith(
                      color: AppColors.mainTextBlackColor,
                      fontSize: Dimens.fontSize16,
                      fontWeight: FontWeight.w500,
                    ),
                    textInputType: TextInputType.visiblePassword,
                    maxLength: Dimens.maxLengthPassword,
                    input: TextInputAction.next,
                    onChange: newUserQues.passwordChange,
                    obscureText: state.currentPasswordObscureText,
                    suffix: GestureDetector(
                      onTap: newUserQues.togglePassObscureText,
                      child: Text(
                        state.currentPasswordObscureText
                            ? ctx.appString.showKey
                            : ctx.appString.hideKey,
                        style: context.textTheme.titleMedium?.copyWith(
                          color: AppColors.mainTextBlackColor,
                          fontSize: Dimens.fontSize12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    validator: (value) =>
                        value.toString().trim().validatePassword(context),
                  );
                },
                buildWhen: (prev, curr) =>
                    prev.signupLocal.password != curr.signupLocal.password ||
                    prev.currentPasswordObscureText !=
                        curr.currentPasswordObscureText,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormField({
    required BuildContext context,
    required String label,
    required String hint,
    required TextEditingController controller,
    required TextInputType inputType,
    required TextInputAction textInputAction,
    required ValueChanged<String> onChange,
    required FormFieldValidator<dynamic> validator,
    required bool Function(
            NewUserQuestionnairesState, NewUserQuestionnairesState)
        buildWhen,
  }) {
    return BlocBuilder<NewUserQuestionnairesCubit, NewUserQuestionnairesState>(
      builder: (ctx, state) {
        return CustomTextFormFieldWidget(
          controller: controller,
          hint: hint,
          label: label,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          floatingStyle: context.textTheme.titleMedium?.copyWith(
            color: AppColors.mainTextBlackColor,
            fontSize: Dimens.fontSize16,
            fontWeight: FontWeight.w500,
          ),
          textInputType: inputType,
          input: textInputAction,
          onChange: onChange,
          validator: validator,
        );
      },
      buildWhen: buildWhen,
    );
  }
}
