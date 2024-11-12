import '../../../../../../utils/exports.dart';

class BreakfastRecipeListViewWidget extends StatelessWidget {
  const BreakfastRecipeListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: Dimens.padding8,
          left: Dimens.padding16,
          right: Dimens.padding16),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        separatorBuilder: (context, index) => const SizedBox(),
        itemBuilder: (context, index) {
          final item = recipeItems[index];
          return FoodWidget(
            title: 'Food',
            isTitleVisible: false,
            subTitle: item.subTitle,
            foodImage: item.icon ?? Assets.png.icVegetable.path,
            makingTime: "30 Min",
            isMakingTimeVisible: true,
            onDotIconTap: () {},
            isAddIconVisible: true,
          );
        },
      ),
    );
  }
}
