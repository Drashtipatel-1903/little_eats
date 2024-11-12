import '../../../../../../utils/exports.dart';

class GroceryHeaderWidget extends StatelessWidget {
  const GroceryHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: Dimens.elevation1,
      child: Padding(
        padding: const EdgeInsets.all(Dimens.padding16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextLabelWidget(
              label: context.appString.groceryListKey,
              style: context.textTheme.titleMedium?.copyWith(
                  color: AppColors.mainTextBlackColor,
                  fontWeight: FontWeight.w700,
                  fontSize: Dimens.fontSize18),
            ),
            Assets.svgs.icPro.svg(),
          ],
        ),
      ),
    );
  }
}
