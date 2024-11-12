import '../../../../utils/exports.dart';

@RoutePage()
class EditProfilePage extends BaseResponsiveView {
  const EditProfilePage({Key? key}) : super(key: key);

  Widget _buildView(BuildContext context) {
    return const EditProfileWidget();
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
