import '../../../../../utils/exports.dart';

/// use this class to show AppBar at app level(Global or Shared AppBar)
/// ( to be used in MyApp Widget)
class MainAppBarWidget extends StatelessWidget {
  final Color? backgroundColor;
  final String? title;

  const MainAppBarWidget({Key? key, this.backgroundColor, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // This automaticallyImplyLeading flag will not show default Android-OS back button if not set at Flutter end.
      automaticallyImplyLeading: false,
      toolbarHeight: Dimens.appBarHeight,
      leadingWidth: Dimens.zero,
      elevation: Dimens.elevation0,
      titleSpacing: Dimens.zero,
      backgroundColor: backgroundColor,
      title: MainAppBarTitleWidget(
        title: title,
      ),
    );
  }
}
