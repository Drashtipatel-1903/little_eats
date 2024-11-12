import '../../../../utils/exports.dart';

@RoutePage()
class SubscriptionPage extends BaseResponsiveView {
  const SubscriptionPage({Key? key}) : super(key: key);

  Widget _buildView(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.primary,
            AppColors.whiteBGColor,
          ],
          stops: [0.0, 0.35],
        ),
      ),
      child: const SingleChildScrollView(
        child: Column(
          children: [
            SubscriptionHeaderWidget(),
            SizedBox(
              height: Dimens.space40,
            ),
            SubscriptionTermsWidget(),
            SizedBox(
              height: Dimens.space16,
            ),
            SubscriptionPlanListView(),
            SizedBox(
              height: Dimens.space16,
            ),
            SubscriptionBottomWidget(),
          ],
        ),
      ),
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
