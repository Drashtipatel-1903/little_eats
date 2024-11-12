import '../../../../utils/exports.dart';

@RoutePage()
class ForgotPasswordPage extends BaseResponsiveView {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  Widget _buildView(BuildContext context) {
    return const ForgotPasswordForm();
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
