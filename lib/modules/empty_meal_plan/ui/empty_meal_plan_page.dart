import '../../../../utils/exports.dart';

@RoutePage()
class EmptyMealPlanPage extends BaseResponsiveView {
  const EmptyMealPlanPage({Key? key}) : super(key: key);

  Widget _buildView(BuildContext context) {
    return const EmptyMealPlanWidget();
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
