import '../../../../../../utils/exports.dart';

@RoutePage()
class LikeDislikePage extends StatelessWidget {
  const LikeDislikePage({super.key});

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
                title: context.appString.likeDislikeKey,
                isBackButtonVisible: true,
                isCloseButtonVisible: false,
              ),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: ChildLikeDislikeWidget(),
              ),
            )
          ],
        ),
      ),
    );
  }
}