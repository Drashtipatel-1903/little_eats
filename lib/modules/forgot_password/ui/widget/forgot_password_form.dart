import '../../../../utils/exports.dart';

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: Dimens.space32,
            ),
            CenterAppbarWidget(
              title: context.appString.forgotPassTitleKey,
              onCloseButtonTap: () {},
              isCloseButtonVisible: false,
              isBackButtonVisible: true,
              onBackButtonTap: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: Dimens.space16,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(Dimens.padding16),
                child: Column(
                  children: [
                    CustomTextLabelWidget(
                      label: context.appString.forgotPassDescKey,
                      textAlign: TextAlign.center,
                      style: context.textTheme.titleMedium?.copyWith(
                        color: AppColors.mainTextBlackColor,
                        fontSize: Dimens.fontSize15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: Dimens.space24,
                    ),
                    CustomTextFormFieldWidget(
                      controller: TextEditingController(),
                      hint: context.appString.emailKey,
                      label: context.appString.emailKey,
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      floatingStyle: context.textTheme.titleMedium?.copyWith(
                          color: AppColors.mainTextBlackColor,
                          fontSize: Dimens.fontSize16,
                          fontWeight: FontWeight.w500),
                      textInputType: TextInputType.visiblePassword,
                      maxLength: Dimens.maxLengthPassword,
                      input: TextInputAction.done,
                      onChange: (value) {
                        //loginCubit.passwordChange(value);
                      },
                    ),
                    const SizedBox(
                      height: Dimens.space24,
                    ),
                    CustomButtonWidget(
                      onClick: () {
                        context.router.pushNamed(AppPaths.verifyEmail);
                      },
                      text: context.appString.sendKey,
                      textStyle: context.textTheme.titleMedium?.copyWith(
                          color: AppColors.whiteTextColor,
                          fontSize: Dimens.fontSize16),
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
