import '../../../../../utils/exports.dart';

class FoodItemData {
  final String title;
  final String subTitle;
  final String? makingTime;
  final String? icon;
  final bool? isMakingTimeVisible;

  const FoodItemData({
    required this.title,
    required this.subTitle,
    this.makingTime,
    this.isMakingTimeVisible = false,
    this.icon,
  });
}

// Define a data model for food items
final List<FoodItemData> recipeItems = [
  FoodItemData(
    title: MainConfig.context.appString.foodKey,
    subTitle: 'Carrot',
    icon: Assets.png.icVegetable.path,
  ),
  FoodItemData(
    title: MainConfig.context.appString.recipeKey,
    subTitle: 'Pancake',
    makingTime: '30 Mins',
    isMakingTimeVisible: true,
    icon: Assets.png.icVegetable.path,
  ),
  FoodItemData(
    title: MainConfig.context.appString.recipeKey,
    subTitle: 'Cakes',
    makingTime: '45 Mins',
    icon: Assets.png.icVegetable.path,
  ),
  FoodItemData(
    title: MainConfig.context.appString.recipeKey,
    subTitle: 'Pancake',
    makingTime: '30 Mins', // makingTime is provided
    icon: Assets.png.icVegetable.path,
  ),
  FoodItemData(
    title: MainConfig.context.appString.recipeKey,
    subTitle: 'Pancake',
    makingTime: '30 Mins', // makingTime is provided
    icon: Assets.png.icVegetable.path,
  ),
];
