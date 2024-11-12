import '../../../../../utils/exports.dart';

class MealItemData {
  final String title;
  final String icon;

  const MealItemData({
    required this.title,
    required this.icon,
  });
}

final List<MealItemData> mealItems = [
  MealItemData(
    title: MainConfig.context.appString.addBreakFastKey,
    icon: Assets.svgs.icAdd.path,
  ),
  MealItemData(
    title: MainConfig.context.appString.addLunchKey,
    icon: Assets.svgs.icAdd.path,
  ),
  MealItemData(
    title: MainConfig.context.appString.addDinnerKey,
    icon: Assets.svgs.icAdd.path,
  ),
  MealItemData(
    title: MainConfig.context.appString.addSnacksKey,
    icon: Assets.svgs.icAdd.path,
  ),
];
