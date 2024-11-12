import '../../../../utils/exports.dart';

@RoutePage()
class EditChildProfilePage extends BaseResponsiveView {
  const EditChildProfilePage({Key? key}) : super(key: key);

  Widget _buildView(BuildContext context) {
    return const Column(
      children: [
        EditChildProfileWidget()
      ],
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
