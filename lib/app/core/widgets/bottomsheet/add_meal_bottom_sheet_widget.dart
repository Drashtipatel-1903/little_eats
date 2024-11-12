import '../../../../utils/exports.dart';

class AddMealBottomSheet extends StatelessWidget {
  final Function()? onAddFood;
  final Function()? onAddRecipe;
  final Function()? onCopyMeal;
  final Function()? onCancel;

  const AddMealBottomSheet({
    Key? key,
    this.onAddFood,
    this.onAddRecipe,
    this.onCopyMeal,
    this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimens.radius16),
          topRight: Radius.circular(Dimens.radius16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: onAddFood,
            child: Padding(
              padding: const EdgeInsets.all(Dimens.padding16),
              child: CustomTextLabelWidget(
                label: context.appString.addFoodKey,
                style: context.textTheme.titleMedium?.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                    fontSize: Dimens.fontSize16),
              ),
            ),
          ),
          const CustomDivider(
            height: Dimens.borderWidth1_5,
            color: AppColors.lightGreyColor,
          ),
          GestureDetector(
            onTap: onAddRecipe,
            child: Padding(
              padding: const EdgeInsets.all(Dimens.padding16),
              child: CustomTextLabelWidget(
                label: context.appString.addRecipeKey,
                style: context.textTheme.titleMedium?.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                    fontSize: Dimens.fontSize16),
              ),
            ),
          ),
          const CustomDivider(
            height: Dimens.borderWidth1_5,
            color: AppColors.lightGreyColor,
          ),
          GestureDetector(
            onTap: onCopyMeal,
            child: Padding(
              padding: const EdgeInsets.all(16.0), // Item padding
              child: CustomTextLabelWidget(
                label: context.appString.copyMealKey,
                style: context.textTheme.titleMedium?.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                    fontSize: Dimens.fontSize16),
              ),
            ),
          ),
          const CustomDivider(
            height: Dimens.borderWidth1_5,
            color: AppColors.lightGreyColor,
          ),
          GestureDetector(
            onTap: onCancel,
            child: Padding(
              padding: const EdgeInsets.all(16.0), // Item padding
              child: CustomTextLabelWidget(
                label: context.appString.cancelKey,
                style: context.textTheme.titleMedium?.copyWith(
                    color: AppColors.mainTextBlackColor,
                    fontWeight: FontWeight.w600,
                    fontSize: Dimens.fontSize16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
