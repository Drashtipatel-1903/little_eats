import '../../../../../../utils/exports.dart';

class EditProfileWidget extends StatelessWidget {
  const EditProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: Dimens.space32,
              ),
              CenterAppbarWidget(
                title: context.appString.editProfileKey,
                onCloseButtonTap: () {

                },
                isCloseButtonVisible: false,
                isBackButtonVisible: true,
                onBackButtonTap: () {
                  Navigator.pop(context);
                },
              ),
              const CustomDivider(
                height: Dimens.borderWidth1_5,
                color: AppColors.lightGreyColor,
              ),
              TabBar(
                isScrollable: false,
                indicatorColor: AppColors.primary,
                indicatorWeight: 1,
                padding: const EdgeInsets.only(left: 0),
                labelColor: AppColors.primary,
                labelStyle: context.textTheme.titleMedium?.copyWith(
                  color: AppColors.redTextColor,
                  fontSize: Dimens.fontSize16,
                  fontWeight: FontWeight.w600,
                ),
                labelPadding: const EdgeInsets.symmetric(horizontal: 16),
                indicatorPadding: EdgeInsets.zero,
                dividerHeight: Dimens.borderWidth1_5,
                dividerColor: AppColors.lightGreyColor,
                unselectedLabelColor: AppColors.mainTextBlackColor,
                unselectedLabelStyle: context.textTheme.titleMedium?.copyWith(
                  color: AppColors.redTextColor,
                  fontSize: Dimens.fontSize16,
                  fontWeight: FontWeight.w600,
                ),
                tabs: [
                  Tab(text: context.appString.personalDetailsKey),
                  Tab(text: context.appString.changePasswordKey),
                ],
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    PersonalDetailsWidget(),
                    ChangePasswordWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
