import '../../../../../../utils/exports.dart';

@RoutePage()
class ChildAllergyPage extends StatelessWidget {
  const ChildAllergyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: Dimens.space24,
            ),
            Material(
              elevation: Dimens.elevation1,
              child: CenterAppbarWidget(
                onCloseButtonTap: () {},
                onBackButtonTap: () {
                  Navigator.pop(context);
                },
                title: context.appString.allergyKey,
                isBackButtonVisible: true,
                isCloseButtonVisible: false,
              ),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: Dimens.padding16, right: Dimens.padding16),
                child: ChildAllergyWidget(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
