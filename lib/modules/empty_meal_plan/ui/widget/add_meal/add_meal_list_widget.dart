import '../../../../../../utils/exports.dart';

class AddMealListWidget extends StatelessWidget {
  const AddMealListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.padding16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AddFoodHeaderWidget(
            title: 'Breakfast',
            onDeleteTap: () {
              showCustomDialogOld(
                context.appString.deleteAccountDescKey,
                title: context.appString.deleteAccountKey,
                okBtnTitle: "Yes, Delete",
                cancelBtnTitle: context.appString.cancelKey,
                onOkClicked: () {
                  Navigator.pop(context);
                },
                onCancelClicked: () {
                  Navigator.pop(context);
                },
              );
            },
            onAddTap: () {
              showIOSBottomSheet(
                context: context,
                labelFirst: context.appString.addFoodKey,
                labelSecond: context.appString.addRecipeKey,
                labelThird: context.appString.copyMealKey,
                cancelButtonText: context.appString.cancelKey,
                isFourthLabelVisible: true,
                firstLabelColor: AppColors.primary,
                secondLabelColor: AppColors.primary,
                thirdLabelColor: AppColors.primary,
                onFirstLabelTap: () {},
                onThirdLabelTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.red,
                    builder: (context) => CopyMealCalenderWidget(
                      onDateSelected: (date) {},
                      onCancel: () {},
                      selectedDay: DateTime.now(),
                    ),
                  );
                },
              );
            },
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: /*recipeItems.length*/ 3,
            separatorBuilder: (context, index) => const SizedBox(),
            itemBuilder: (context, index) {
              final item = recipeItems[index];
              String? labelFirst;
              String? labelSecond;
              String? labelThird;
              String? labelFourth;

              if (item.title == context.appString.foodKey) {
                labelFirst = context.appString.replaceFoodKey;
                labelSecond = context.appString.deleteFoodKey;
                labelThird = context.appString.cancelKey;
                labelFourth = null; // No fourth label for food
              } else if (item.title == context.appString.recipeKey) {
                labelFirst = context.appString.viewRecipeKey;
                labelSecond = "Replace Recipe";
                labelThird = "Delete Recipe";
                labelFourth =
                    context.appString.cancelKey; // Fourth label for recipe
              }

              return Visibility(
                child: FoodWidget(
                  title: item.title,
                  isTitleVisible: true,
                  isMakingTimeVisible: true,
                  subTitle: item.subTitle,
                  makingTime: item.makingTime,
                  foodImage: item.icon ?? Assets.png.icVegetable.path,
                  isDotIconVisible: true,
                  isFromHomeScreen: true,
                  onDotIconTap: () {
                    showIOSBottomSheet(
                      context: context,
                      labelFirst: labelFirst,
                      labelSecond: labelSecond,
                      labelThird: labelThird,
                      cancelButtonText: labelFourth,
                      isFourthLabelVisible: labelFourth != null,
                      firstLabelColor: AppColors.primary,
                      secondLabelColor: labelSecond == "Replace Recipe"
                          ? AppColors.primary
                          : AppColors.redTextColor,
                      thirdLabelColor: labelThird == "Delete Recipe"
                          ? AppColors.redTextColor
                          : AppColors.mainTextBlackColor,
                      onFirstLabelTap: () {
                        Navigator.pop(context);
                        context.router.pushNamed(AppPaths.viewRecipe);
                      },
                      onSecondLabelTap: () {
                        Navigator.pop(context);
                      },
                      onFourthLabelTap: () {
                        Navigator.pop(context);
                      },
                      onThirdLabelTap: () {
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              );
            },
          ),
          const SizedBox(
            height: Dimens.space8,
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: mealItems.length,
            separatorBuilder: (context, index) => const SizedBox(
              height: Dimens.padding20,
            ),
            itemBuilder: (context, index) {
              final item = mealItems[index];
              return CommonBorderWithIcon(
                title: item.title,
                onTap: (_, selected) => _handleItemTap(context, index),
                icon: item.icon,
              );
            },
          ),
        ],
      ),
    );
  }
}

void _handleItemTap(BuildContext context, int index) {
  if (index == 0) {
    showIOSBottomSheet(
      context: context,
      labelFirst: context.appString.addFoodKey,
      labelSecond: context.appString.addRecipeKey,
      labelThird: context.appString.cancelKey,
      cancelButtonText: context.appString.cancelKey,
      firstLabelColor: AppColors.primary,
      secondLabelColor: AppColors.primary,
      thirdLabelColor: AppColors.mainTextBlackColor,
      isFourthLabelVisible: false,
      fourthLabelColor: AppColors.mainTextBlackColor,
      onFirstLabelTap: () {
        context.router.pushNamed(AppPaths.addBreakfast);
      },
      onThirdLabelTap: () {
        Navigator.pop(context);
      },
      onSecondLabelTap: () {
        context.router.pushNamed(AppPaths.addBreakfastRecipe);
      },
    );
  }
}
