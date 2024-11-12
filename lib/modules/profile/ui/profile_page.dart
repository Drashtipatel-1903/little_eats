import '../../../../utils/exports.dart';

@RoutePage()
class ProfilePage extends BaseResponsiveView {
  const ProfilePage({Key? key}) : super(key: key);

  Widget _buildView(BuildContext context) {
    return const Column(
      children: [
        ProfileAppBarWidget(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ProfileSubscriptionWidget(),
                MyChildEditProfileWidget(),
                MyProfileSettingListWidget(),
                SizedBox(
                  height: Dimens.space36,
                ),
                BottomButtonsWidget(),
              ],
            ),
          ),
        ),
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
