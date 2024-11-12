import '../../../../utils/exports.dart';

class RecipeInstructionsWidget extends StatelessWidget {
  const RecipeInstructionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> instructions = [
      context.appString.instruction1,
      context.appString.instruction2,
    ];

    return Padding(
      padding: const EdgeInsets.all(Dimens.padding16),
      child: ListView.builder(
        itemCount: instructions.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Step Number
                Text(
                  "${context.appString.stepKey} ${index + 1}",
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: Dimens.fontSize16,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: Dimens.padding4),
                // Instruction Text
                Text(
                  instructions[index],
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: AppColors.mainTextBlackColor,
                    fontSize: Dimens.fontSize15,
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
