import '../../../../utils/exports.dart';

class ViewRecipeHeader extends StatelessWidget {
  const ViewRecipeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.padding16),
      child: Column(
        children: [
          Assets.png.icFood.image(),
        ],
      ),
    );
  }
}
