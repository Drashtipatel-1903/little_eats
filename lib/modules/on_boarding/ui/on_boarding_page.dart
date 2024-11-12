import 'package:little_eats/modules/on_boarding/ui/widget/onboarding_pager_widget.dart';

import '../../../../utils/exports.dart';

@RoutePage()
class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (ctx) => OnBoardingCubit(
              initialState: const OnBoardingState(animationJsonList: []),
            )..init(),
        child: const Scaffold(
          body: Column(
            children: [
              Expanded(child: OnBoardingPagerWidget()),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimens.padding16),
                child: OnBoardingButtonView(),
              ),
            ],
          ),
        ));
  }
}
