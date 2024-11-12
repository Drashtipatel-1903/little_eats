import '../../../../utils/exports.dart';

@RoutePage()
class GroceryPage extends BaseResponsiveView {
  const GroceryPage({Key? key}) : super(key: key);

  Widget _buildView(BuildContext context) {
    return BlocProvider(
      create: (context) => GroceryListCubit(
        initialState: const GroceryListState(),
      )..init(),
      child: const GroceryListWidget(),
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
