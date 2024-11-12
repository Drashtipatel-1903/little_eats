import '../../../../utils/exports.dart';

@RoutePage()
class ResetPasswordPage extends BaseResponsiveView {
  const ResetPasswordPage({Key? key}) : super(key: key);

  Widget _buildView(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit(
          initialState: ResetPasswordState(
        confirmPasswordController: TextEditingController(),
        passwordController: TextEditingController(),
      ),),
      child: const ResetPasswordForm(),
    );
  }

  @override
  buildDesktopWidget(BuildContext context) {
    return _buildView(context);
  }

  @override
  buildMobileWidget(BuildContext context) {
    return _buildView(context);
  }

  @override
  buildTabletWidget(BuildContext context) {
    return _buildView(context);
  }
}
