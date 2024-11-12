import '../../../../utils/exports.dart';

@RoutePage()
class VerifyEmailPage extends BaseResponsiveView {
  const VerifyEmailPage({Key? key}) : super(key: key);

  Widget _buildView(BuildContext context) {
    return const VerifyEmailForm();
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
