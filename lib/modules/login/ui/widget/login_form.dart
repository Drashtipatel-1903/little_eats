import '../../../../utils/exports.dart';

class LoginForm extends BaseResponsiveView {
  const LoginForm({Key? key}) : super(key: key);

  @override
  buildTabletWidget(BuildContext context) {
    return _loginForm(context);
  }

  @override
  Widget buildDesktopWidget(BuildContext context) {
    return _loginForm(context);
  }

  @override
  Widget buildMobileWidget(BuildContext context) {
    return _loginForm(context);
  }

  _loginForm(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();

    return Scaffold(
      backgroundColor: AppColors.whiteBGColor,
      body: Padding(
        padding: const EdgeInsets.only(
            left: Dimens.padding16, right: Dimens.padding16),
        child: BlocListener<LoginCubit, LoginState>(
          listener: (ctx, state) {
            if (state.status == BaseStateStatus.loading) {
              showLoader(value: true);
            } else {
              EasyLoading.dismiss();
            }

            if (state.status == BaseStateStatus.success) {
              context.router.pushNamed(AppPaths.dashboard);
            }

            if (state.status == BaseStateStatus.failure) {
              displaySnackBar("Login failed. Please try again.", context);
            }
          },
          child: Form(
            key: context.instance<LoginCubit>().formKey,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Padding(
                            padding: EdgeInsets.only(top: Dimens.padding20)),
                        CenterAppbarWidget(
                          title: context.appString.loginKey,
                          isBackButtonVisible: false,
                          isCloseButtonVisible: false,
                          onBackButtonTap: () {},
                          onCloseButtonTap: () {},
                          isTitleVisible: false,
                        ),
                        const Padding(
                            padding: EdgeInsets.only(top: Dimens.padding50)),
                        const CommonHeaderView(),
                        const SizedBox(
                          height: Dimens.space32,
                        ),

                        /// Email
                        BlocBuilder<LoginCubit, LoginState>(
                          builder: (ctx, state) {
                            return CustomTextFormFieldWidget(
                              controller: state.emailController,
                              hint: context.appString.emailKey,
                              label: context.appString.emailKey,
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              textInputType: TextInputType.emailAddress,
                              floatingStyle: context.textTheme.titleMedium
                                  ?.copyWith(
                                      color: AppColors.mainTextBlackColor,
                                      fontSize: Dimens.fontSize16,
                                      fontWeight: FontWeight.w500),
                              input: TextInputAction.next,
                              onChange: (value) {
                                loginCubit.emailChange(value);
                              },
                              validator: (value) {
                                return value
                                    .toString()
                                    .trim()
                                    .validateEmail(context);
                              },
                            );
                          },
                          buildWhen: (previous, current) =>
                              previous.loginLocal.email !=
                              current.loginLocal.email,
                        ),
                        const SizedBox(
                          height: Dimens.space24,
                        ),

                        /// Password
                        BlocBuilder<LoginCubit, LoginState>(
                          builder: (ctx, state) {
                            return CustomTextFormFieldWidget(
                              controller: state.passwordController,
                              hint: context.appString.passwordKey,
                              label: context.appString.passwordKey,
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              floatingStyle: context.textTheme.titleMedium
                                  ?.copyWith(
                                      color: AppColors.mainTextBlackColor,
                                      fontSize: Dimens.fontSize16,
                                      fontWeight: FontWeight.w500),
                              textInputType: TextInputType.visiblePassword,
                              maxLength: Dimens.maxLengthPassword,
                              input: TextInputAction.done,
                              onChange: (value) {
                                loginCubit.passwordChange(value);
                              },
                              obscureText: state.currentPasswordObscureText,
                              suffix: GestureDetector(
                                onTap: () {
                                  loginCubit.toggleCurrentPassObscureText();
                                },
                                child: Text(
                                  state.currentPasswordObscureText
                                      ? ctx.appString.showKey
                                      : ctx.appString.hideKey,
                                  style:
                                      context.textTheme.titleMedium?.copyWith(
                                    color: AppColors.mainTextBlackColor,
                                    fontSize: Dimens.fontSize14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              validator: (value) {
                                return value
                                    .toString()
                                    .trim()
                                    .validatePassword(context);
                              },
                            );
                          },
                          buildWhen: (previous, current) =>
                              previous.loginLocal.password !=
                                  current.loginLocal.password ||
                              previous.currentPasswordObscureText !=
                                  current.currentPasswordObscureText,
                        ),
                        const SizedBox(
                          height: Dimens.space32,
                        ),

                        /// Login Button
                        CustomButtonWidget(
                          onClick: () => loginCubit.loginValidation(context),
                          isDisable: loginCubit.state.isBtnDisable,
                          text: context.appString.loginKey,
                          backgroundColor: !loginCubit.state.isBtnDisable
                              ? AppColors.primary
                              : AppColors.lightGrayBGColor,
                          textStyle: context.textTheme.titleMedium?.copyWith(
                              color: !loginCubit.state.isBtnDisable
                                  ? AppColors.whiteTextColor
                                  : AppColors.primary.withOpacity(0.6),
                              fontSize: Dimens.fontSize16),
                        ),
                        const SizedBox(
                          height: Dimens.space16,
                        ),

                        /// Forgot Password
                        InkWell(
                          onTap: () {
                            context.router.pushNamed(AppPaths.forgotPassword);
                          },
                          child: CustomTextLabelWidget(
                            label: context.appString.forgotPassWordKey,
                            style: context.textTheme.titleMedium?.copyWith(
                                color: AppColors.blueColor,
                                fontWeight: FontWeight.w600,
                                fontSize: Dimens.fontSize14),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: Dimens.space16),

                /// New To Little Eats Button
                BlocListener<LoginCubit, LoginState>(
                  listener: (ctx, state) {},
                  child: CustomOutlineButton(
                    title: context.appString.newToLittleEatsKey,
                    onTap: () {
                      context.router.pushNamed(AppPaths.newUserQuestionnaires);
                    },
                    titleTextStyle: context.textTheme.titleMedium?.copyWith(
                        fontSize: Dimens.fontSize16,
                        color: AppColors.blueColor),
                    titleColor: AppColors.blueColor,
                    borderWidth: Dimens.borderWidth1,
                    contentPadding: const EdgeInsets.all(Dimens.padding16),
                  ),
                ),
                const SizedBox(height: Dimens.space16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
