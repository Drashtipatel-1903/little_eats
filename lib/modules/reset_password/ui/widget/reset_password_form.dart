import '../../../../utils/exports.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final resetPasswordCubit = context.read<ResetPasswordCubit>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: Dimens.space32,
            ),
            CenterAppbarWidget(
              title: context.appString.resetPasswordKey,
              onCloseButtonTap: () {},
              isCloseButtonVisible: false,
              isBackButtonVisible: true,
              onBackButtonTap: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: Dimens.space24,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: Dimens.padding16, right: Dimens.padding16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomTextLabelWidget(
                      label: context.appString.resetPasswordDescKey,
                      textAlign: TextAlign.center,
                      style: context.textTheme.titleMedium?.copyWith(
                        color: AppColors.mainTextBlackColor,
                        fontSize: Dimens.fontSize16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: Dimens.space24,
                    ),
                    BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
                      builder: (context, state) {
                        return CustomTextFormFieldWidget(
                          controller: TextEditingController(),
                          hint: context.appString.passwordKey,
                          label: context.appString.passwordKey,
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          floatingStyle:
                              context.textTheme.titleMedium?.copyWith(
                            color: AppColors.mainTextBlackColor,
                            fontSize: Dimens.fontSize16,
                            fontWeight: FontWeight.w500,
                          ),
                          obscureText: state.passwordObscureText,
                          textInputType: TextInputType.visiblePassword,
                          maxLength: Dimens.maxLengthPassword,
                          input: TextInputAction.next,
                          validator: (value) {
                            return value
                                .toString()
                                .trim()
                                .validatePassword(context);
                          },
                          onChange: (value) {
                            resetPasswordCubit.passwordChange(value);
                          },
                          suffix: GestureDetector(
                            onTap: () {
                              resetPasswordCubit.toggleCurrentPassObscureText();
                            },
                            child: Text(
                              state.passwordObscureText
                                  ? context.appString.showKey
                                  : context.appString.hideKey,
                              style: context.textTheme.titleMedium?.copyWith(
                                color: AppColors.mainTextBlackColor,
                                fontSize: Dimens.fontSize12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        );
                      },
                      buildWhen: (previous, current) =>
                          previous.resetPasswordLocal.password !=
                              current.resetPasswordLocal.password ||
                          previous.passwordObscureText !=
                              current.passwordObscureText,
                    ),
                    const SizedBox(
                      height: Dimens.space24,
                    ),
                    BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
                      builder: (context, state) {
                        return CustomTextFormFieldWidget(
                          controller: TextEditingController(),
                          hint: context.appString.confirmPasswordKey,
                          label: context.appString.confirmPasswordKey,
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          floatingStyle:
                              context.textTheme.titleMedium?.copyWith(
                            color: AppColors.mainTextBlackColor,
                            fontSize: Dimens.fontSize16,
                            fontWeight: FontWeight.w500,
                          ),
                          textInputType: TextInputType.visiblePassword,
                          maxLength: Dimens.maxLengthPassword,
                          input: TextInputAction.next,
                          onChange: (value) {
                            resetPasswordCubit.confirmPasswordChange(value);
                          },
                          validator: (value) {
                            return value
                                .toString()
                                .trim()
                                .validateConfirmPassword(
                                    context, state.passwordController.text);
                          },
                          obscureText: state.confirmPasswordObscureText,
                          suffix: GestureDetector(
                            onTap: () {
                              resetPasswordCubit.toggleConfirmPassObscureText();
                            },
                            child: Text(
                              state.confirmPasswordObscureText
                                  ? context.appString.showKey
                                  : context.appString.hideKey,
                              style: context.textTheme.titleMedium?.copyWith(
                                color: AppColors.mainTextBlackColor,
                                fontSize: Dimens.fontSize12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        );
                      },
                      buildWhen: (previous, current) =>
                          previous.resetPasswordLocal.confirmPassword !=
                              current.resetPasswordLocal.confirmPassword ||
                          previous.confirmPasswordObscureText !=
                              current.confirmPasswordObscureText,
                    ),
                    const SizedBox(
                      height: Dimens.space28,
                    ),
                    CustomButtonWidget(
                      onClick: () {
                        context.router.pushNamed(AppPaths.dashboard);
                      },
                      text: context.appString.verifyKey,
                      textStyle: context.textTheme.titleMedium?.copyWith(
                        color: AppColors.whiteTextColor,
                        fontSize: Dimens.fontSize16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
