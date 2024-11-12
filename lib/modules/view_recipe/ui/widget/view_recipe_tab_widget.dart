import '../../../../utils/exports.dart';

class ViewRecipeTabWidget extends StatelessWidget {
  const ViewRecipeTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: Dimens.tabCount03,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: Dimens.space28,
              ),
              const CustomDivider(
                height: Dimens.borderWidth1_5,
                color: AppColors.lightGreyColor,
              ),
              // Tab Bar
              TabBar(
                isScrollable: false,
                indicatorColor: AppColors.primary,
                indicatorWeight: Dimens.lineHeight1,
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
                  Tab(text: context.appString.descriptionKey),
                  Tab(text: context.appString.ingredientsKey),
                  Tab(text: context.appString.instructionsKey),
                ],
              ),
              // Using Flexible to avoid overflow
              const Flexible(
                child: TabBarView(
                  children: [
                    RecipeDescriptionWidget(),
                    RecipeIngredientsWidget(),
                    RecipeInstructionsWidget(),
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
