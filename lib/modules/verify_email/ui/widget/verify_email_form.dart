import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../utils/exports.dart';

class VerifyEmailForm extends StatelessWidget {
  const VerifyEmailForm({super.key});

  @override
  Widget build(BuildContext context) {
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
              title: context.appString.verifyYourEmailKey,
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
                padding: const EdgeInsets.only(left : Dimens.padding16 , right: Dimens.padding16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomRichTextLabel(
                      primaryLabel: context.appString.verifyYourEmailDescKey,
                      secondaryLabel: context.appString.dummyEmail,
                      secondaryStyle: context.textTheme.titleMedium?.copyWith(
                        color: AppColors.primary,
                        fontSize: Dimens.fontSize16,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                      primaryStyle: context.textTheme.titleMedium?.copyWith(
                        color: AppColors.mainTextBlackColor,
                        fontSize: Dimens.fontSize16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: Dimens.space24,
                    ),
                    PinCodeTextField(
                      appContext: context,
                      length: Dimens.itemCount4,
                      obscureText: false,
                      keyboardType: TextInputType.number,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      autoDisposeControllers: true,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      mainAxisAlignment: MainAxisAlignment.center,
                      animationType: AnimationType.scale,
                      cursorHeight: Dimens.space28,
                      cursorColor: AppColors.mainTextBlackColor,
                      pinTheme: PinTheme(
                        activeColor: AppColors.inActiveGrayColor,
                        disabledColor: AppColors.inActiveGrayColor,
                        inactiveColor: AppColors.inActiveGrayColor,
                        selectedColor: AppColors.mainTextBlackColor,
                        shape: PinCodeFieldShape.box,
                        errorBorderColor: AppColors.inActiveGrayColor,
                        borderRadius: BorderRadius.circular(Dimens.radius6),
                        fieldWidth: Dimens.space65,
                        fieldHeight: Dimens.space65,
                        fieldOuterPadding: const EdgeInsets.symmetric(
                            horizontal: Dimens.space6),
                        activeBorderWidth: Dimens.borderWidth1,
                        inactiveBorderWidth: Dimens.borderWidth1,
                        selectedBorderWidth: Dimens.borderWidth1_5,
                        borderWidth: Dimens.borderWidth1,
                        activeFillColor: AppColors.whiteBGColor,
                      ),
                    ),
                    const SizedBox(
                      height: Dimens.space24,
                    ),
                    CustomButtonWidget(
                      onClick: () {
                        context.router.pushNamed(AppPaths.resetPassword);
                      },
                      text: context.appString.verifyKey,
                      textStyle: context.textTheme.titleMedium?.copyWith(
                        color: AppColors.whiteTextColor,
                        fontSize: Dimens.fontSize16,
                      ),
                    ),
                    const SizedBox(
                      height: Dimens.space32,
                    ),
                    CustomTextLabelWidget(
                      label: context.appString.resendCodeKey,
                      textAlign: TextAlign.center,
                      style: context.textTheme.titleMedium?.copyWith(
                        color: AppColors.primary,
                        fontSize: Dimens.fontSize15,
                        fontWeight: FontWeight.w600,
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
