import '../../../../../../utils/exports.dart';

class AddBreakfastRecipeListWidget extends StatelessWidget {
  const AddBreakfastRecipeListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isSearchVisibleNotifier = ValueNotifier(false);

    return DefaultTabController(
      length: Dimens.tabCount06,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: Dimens.space32,
              ),
              AppbarWithTitleIcon(
                title: context.appString.addBreakFastRecipeKey,
                onCloseButtonTap: () {
                  if (Navigator.of(context).canPop()) {
                    Navigator.of(context).pop();
                  }
                  Navigator.pop(context);
                },
                isSearchVisibleNotifier: isSearchVisibleNotifier,
              ),
              const CustomDivider(
                height: Dimens.borderWidth1_5,
                color: AppColors.lightGreyColor,
              ),
              TabBar(
                isScrollable: true,
                indicatorColor: AppColors.primary,
                indicatorWeight: Dimens.lineHeight1,
                padding: const EdgeInsets.only(left: Dimens.padding0),
                labelColor: AppColors.primary,
                labelStyle: context.textTheme.titleMedium?.copyWith(
                  color: AppColors.redTextColor,
                  fontSize: Dimens.fontSize16,
                  fontWeight: FontWeight.w600,
                ),
                tabAlignment: TabAlignment.start,
                labelPadding:
                    const EdgeInsets.symmetric(horizontal: Dimens.padding16),
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
                  Tab(text: context.appString.eggLessKey),
                  Tab(text: context.appString.freezableKey),
                  Tab(text: context.appString.proteinKey),
                  Tab(text: context.appString.ironKey),
                  Tab(text: context.appString.highFatKey),
                  Tab(text: context.appString.forTheFamilyKey),
                ],
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    BreakfastRecipeListViewWidget(),
                    BreakfastRecipeListViewWidget(),
                    BreakfastRecipeListViewWidget(),
                    BreakfastRecipeListViewWidget(),
                    BreakfastRecipeListViewWidget(),
                    BreakfastRecipeListViewWidget(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(Dimens.padding16),
                child: SizedBox(
                  width: double.infinity,
                  child: CustomButtonWidget(
                    onClick: () {
                      if (Navigator.of(context).canPop()) {
                        Navigator.of(context).pop();
                      }
                      Navigator.pop(context);
                    },
                    text: context.appString.addRecipeKey,
                    textStyle: context.textTheme.titleMedium?.copyWith(
                        color: AppColors.whiteTextColor,
                        fontSize: Dimens.fontSize16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
