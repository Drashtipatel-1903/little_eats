import '../../../../utils/exports.dart';

@RoutePage()
class PageNotFound extends BaseResponsiveView {
  const PageNotFound({Key? key}) : super(key: key);

  _buildViews(BuildContext context) {
    return Center(
        child:
            CustomTextLabelWidget(label: context.appString.pageNotFoundKey));
  }

  @override
  buildDesktopWidget(BuildContext context) {
    return _buildViews(context);
  }

  @override
  buildMobileWidget(BuildContext context) {
    return _buildViews(context);
  }

  @override
  buildTabletWidget(BuildContext context) {
    return _buildViews(context);
  }
}
