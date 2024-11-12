import '../../../../../utils/exports.dart';

@RoutePage()
class EditChildPhotoPage extends BaseResponsiveView {
  const EditChildPhotoPage({Key? key}) : super(key: key);

  Widget _buildView(BuildContext context) {
    return const EditChildPhotoWidget();
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
