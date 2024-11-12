import '../../../../../utils/exports.dart';

class SubscriptionPlanModel {
  final String planTitle;
  final String planDesc;
  bool? isSelected;
  final VoidCallback? onTap;
  final bool? hasDiscount;
  final String? discountPercentage;

  SubscriptionPlanModel({
    required this.planTitle,
    required this.planDesc,
    this.isSelected = false,
    this.onTap,
    this.discountPercentage,
    this.hasDiscount,
  });
}

final List<SubscriptionPlanModel> planListItem = [
  SubscriptionPlanModel(
    planTitle: MainConfig.context.appString.monthlyKey,
    planDesc: MainConfig.context.appString.monthlyDescKey,
    isSelected: true,
    discountPercentage: "69",
    hasDiscount: true,
  ),
  SubscriptionPlanModel(
    planTitle: MainConfig.context.appString.annualKey,
    planDesc: MainConfig.context.appString.annualDescKey,
    isSelected: false,
    discountPercentage: "69",
    hasDiscount: false,
  ),
];
