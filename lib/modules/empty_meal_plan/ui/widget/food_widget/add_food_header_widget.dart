import '../../../../../utils/exports.dart';

class AddFoodHeaderWidget extends StatelessWidget {
  final String title;
  final VoidCallback? onDeleteTap;
  final VoidCallback? onAddTap;

  const AddFoodHeaderWidget({
    super.key,
    required this.title,
    this.onDeleteTap,
    this.onAddTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Expanded(
          child: CustomTextLabelWidget(
            label: title,
            textAlign: TextAlign.start,
            style: context.textTheme.titleMedium?.copyWith(
              color: AppColors.mainTextBlackColor,
              fontWeight: FontWeight.w700,
              fontSize: Dimens.fontSize18,
            ),
          ),
        ),

        // Action Buttons
        Row(
          children: [
            InkWell(
              onTap: () {
               if(onDeleteTap != null){
                 onDeleteTap!();
               }

              },
              child: Assets.svgs.icDelete
                  .svg(width: Dimens.iconSize30, height: Dimens.iconSize30),
            ),
            const SizedBox(
              width: Dimens.size14,
            ),
            InkWell(
              onTap: () {
                if (onAddTap != null) {
                  onAddTap!(); // Call the onAddTap callback
                }
              },
              child: Assets.svgs.icAdd
                  .svg(width: Dimens.iconSize30, height: Dimens.iconSize30),
            )
          ],
        ),
      ],
    );
  }
}
