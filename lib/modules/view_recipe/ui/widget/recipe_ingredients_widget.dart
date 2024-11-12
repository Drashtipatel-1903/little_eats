import '../../../../utils/exports.dart';

class RecipeIngredientsWidget extends StatelessWidget {
  const RecipeIngredientsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> ingredients = [
      "1½ cups all-purpose flour",
      "3½ teaspoons baking powder",
      "1 tablespoon white sugar",
      "¼ teaspoon salt, or more to taste",
      "1¼ cups milk",
      "3 tablespoons butter, melted",
      "1 egg",
    ];

    return Padding(
      padding: const EdgeInsets.all(Dimens.padding16),
      child: ListView.builder(
        itemCount: ingredients.length,
        itemBuilder: (context, index) {
          final parts = ingredients[index].split(' ');
          final quantity = parts.first;
          final ingredientName = parts.sublist(1).join(' ');

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("• ", style: TextStyle(fontSize: 18)),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "$quantity ",
                          style: context.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainTextBlackColor,
                            fontSize: Dimens.fontSize15,
                          ),
                        ),
                        TextSpan(
                          text: ingredientName,
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: AppColors.mainTextBlackColor,
                            fontSize: Dimens.fontSize15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
