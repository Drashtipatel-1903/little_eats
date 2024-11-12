import '../../../../../utils/exports.dart';

class ChangePasswordWidget extends StatelessWidget {
  const ChangePasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: Dimens.space20,
        ),

        /// Current Password Field
        Padding(
            padding: const EdgeInsets.only(
                left: Dimens.padding16, right: Dimens.padding16),
            child: CustomTextFormFieldWidget(
              controller: TextEditingController(),
              hint: context.appString.currentPasswordKey,
              label: context.appString.currentPasswordKey,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              floatingStyle: context.textTheme.titleMedium?.copyWith(
                color: AppColors.hintTextColor,
                fontSize: Dimens.fontSize16,
                fontWeight: FontWeight.w500,
              ),
              textInputType: TextInputType.visiblePassword,
              maxLength: Dimens.maxLengthPassword,
              input: TextInputAction.done,
              onChange: (value) {
                // loginCubit.passwordChange(value);
              },
/*
            obscureText: state.currentPasswordObscureText,
*/
              suffix: GestureDetector(
                onTap: () {
                  //loginCubit.toggleCurrentPassObscureText();
                },
                child: Text(
                  /*state.currentPasswordObscureText
                    ? ctx.appString.showKey
                    : */
                  context.appString.hideKey,
                  style: context.textTheme.titleMedium?.copyWith(
                    color: AppColors.mainTextBlackColor,
                    fontSize: Dimens.fontSize12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              validator: (value) {
                return value.toString().trim().validatePassword(context);
              },
            )),
        const SizedBox(
          height: Dimens.space24,
        ),

        /// New password Field
        Padding(
            padding: const EdgeInsets.only(
                left: Dimens.padding16, right: Dimens.padding16),
            child: CustomTextFormFieldWidget(
              controller: TextEditingController(),
              hint: context.appString.newPasswordKey,
              label: context.appString.newPasswordKey,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              floatingStyle: context.textTheme.titleMedium?.copyWith(
                color: AppColors.hintTextColor,
                fontSize: Dimens.fontSize16,
                fontWeight: FontWeight.w500,
              ),
              textInputType: TextInputType.visiblePassword,
              maxLength: Dimens.maxLengthPassword,
              input: TextInputAction.done,
              onChange: (value) {
                // loginCubit.passwordChange(value);
              },
/*
            obscureText: state.currentPasswordObscureText,
*/
              suffix: GestureDetector(
                onTap: () {
                  //loginCubit.toggleCurrentPassObscureText();
                },
                child: Text(
                  /*state.currentPasswordObscureText
                    ? ctx.appString.showKey
                    : */
                  context.appString.hideKey,
                  style: context.textTheme.titleMedium?.copyWith(
                    color: AppColors.mainTextBlackColor,
                    fontSize: Dimens.fontSize12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              validator: (value) {
                return value.toString().trim().validatePassword(context);
              },
            )),
        const SizedBox(
          height: Dimens.space24,
        ),

        /// Confirm New Password Field
        Padding(
            padding: const EdgeInsets.only(
                left: Dimens.padding16, right: Dimens.padding16),
            child: CustomTextFormFieldWidget(
              controller: TextEditingController(),
              hint: context.appString.confirmNewPasswordKey,
              label: context.appString.confirmNewPasswordKey,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              floatingStyle: context.textTheme.titleMedium?.copyWith(
                color: AppColors.hintTextColor,
                fontSize: Dimens.fontSize16,
                fontWeight: FontWeight.w500,
              ),
              textInputType: TextInputType.visiblePassword,
              maxLength: Dimens.maxLengthPassword,
              input: TextInputAction.done,
              onChange: (value) {
                // loginCubit.passwordChange(value);
              },
/*
            obscureText: state.currentPasswordObscureText,
*/
              suffix: GestureDetector(
                onTap: () {
                  //loginCubit.toggleCurrentPassObscureText();
                },
                child: Text(
                  /*state.currentPasswordObscureText
                    ? ctx.appString.showKey
                    : */
                  context.appString.hideKey,
                  style: context.textTheme.titleMedium?.copyWith(
                    color: AppColors.mainTextBlackColor,
                    fontSize: Dimens.fontSize12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              validator: (value) {
                return value.toString().trim().validatePassword(context);
              },
            )),
        const SizedBox(
          height: Dimens.space28,
        ),

        /// Save Button
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
