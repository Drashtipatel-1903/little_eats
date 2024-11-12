import '../../../../../../utils/exports.dart';

class GroceryRefreshWidget extends StatelessWidget {
  const GroceryRefreshWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.padding16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextLabelWidget(
            label: context.appString.lastUpdatedOn,
            style: context.textTheme.titleMedium?.copyWith(
              color: AppColors.subTextColor,
              fontWeight: FontWeight.w500,
              fontSize: Dimens.fontSize15,
            ),
          ),
          Assets.svgs.icRefresh.svg(),
        ],
      ),
    );
  }
}
