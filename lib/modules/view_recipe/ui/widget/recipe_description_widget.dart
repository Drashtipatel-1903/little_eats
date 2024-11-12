import '../../../../utils/exports.dart';

class RecipeDescriptionWidget extends StatelessWidget{
  const RecipeDescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.padding16),
      child: CustomTextLabelWidget(
        label: context.appString.recipeDescKey,
        style: context.textTheme.bodyMedium?.copyWith(
          color: AppColors.mainTextBlackColor,
          fontSize: Dimens.fontSize15,
        ),
        textAlign: TextAlign.start,
        maxLines: null,
      ),
    );
  }
}