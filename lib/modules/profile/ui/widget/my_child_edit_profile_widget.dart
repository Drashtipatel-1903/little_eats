import '../../../../utils/exports.dart';

class MyChildEditProfileWidget extends StatelessWidget {
  const MyChildEditProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: Dimens.padding16, right: Dimens.padding16),
      child: Container(
        height: Dimens.space290,
        padding: const EdgeInsets.all(Dimens.padding16),
        decoration: BoxDecoration(
          color: AppColors.lightBlueBGColor,
          borderRadius: BorderRadius.circular(Dimens.radius8),
        ),
        child: const Column(
          children: [
            EditProfileViewWidget(),
          ],
        ),
      ),
    );
  }
}
