import '../../../../utils/exports.dart';

@RoutePage()
class ViewRecipePage extends BaseResponsiveView {
  const ViewRecipePage({Key? key}) : super(key: key);

  Widget _buildView(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: Dimens.space32,
            ),
            // AppBar
            Material(
              elevation: Dimens.elevation1,
              child: CenterAppbarWidget(
                onCloseButtonTap: () {
                  if (Navigator.of(context).canPop()) {
                    Navigator.of(context).pop();
                  }
                },
                onBackButtonTap: () {
                  if (Navigator.of(context).canPop()) {
                    Navigator.of(context).pop();
                  }
                },
                title: context.appString.recipeKey,
                isBackButtonVisible: true,
                isCloseButtonVisible: false,
              ),
            ),
            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ViewRecipeHeader(),
                    RecipePrepTimeWidget(),
                    SizedBox(
                      height: Dimens.height600,
                      child: ViewRecipeTabWidget(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  buildDesktopWidget(BuildContext context) => _buildView(context);

  @override
  buildMobileWidget(BuildContext context) => _buildView(context);

  @override
  buildTabletWidget(BuildContext context) => _buildView(context);
}
