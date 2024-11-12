import '../../../../utils/exports.dart';

class SubscriptionPlanListView extends StatelessWidget {
  const SubscriptionPlanListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: planListItem.length,
      separatorBuilder: (context, index) => const SizedBox(),
      itemBuilder: (context, index) {
        final item = planListItem[index];
        return Visibility(
          child: SubscriptionPlanListWidget(
            planTitle: item.planTitle,
            planDesc: item.planDesc,
            hasDiscount: item.hasDiscount ?? false,
            isSelected: item.isSelected ?? false,
            discountPercentage: item.discountPercentage,
            onTap: () {
              item.isSelected = true;
            },
          ),
        );
      },
    );
  }
}
