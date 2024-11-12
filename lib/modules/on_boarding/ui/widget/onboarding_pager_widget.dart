import 'package:dots_indicator/dots_indicator.dart';

import '../../../../utils/exports.dart';

class OnBoardingPagerWidget extends StatelessWidget {
  const OnBoardingPagerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: state.animationJsonList.length,
                onPageChanged: (value) {
                  context.read<OnBoardingCubit>().onPageChanged(value);
                },
                itemBuilder: (context, index) {
                  return state.animationJsonList[index];
                },
              ),
            ),
            const SizedBox(
              height: Dimens.space10,
            ),
            DotsIndicator(
              dotsCount: state.animationJsonList.length,
              position: state.currentPagerItem,
              decorator: DotsDecorator(
                activeColor: AppColors.mainTextBlackColor,
                color: AppColors.disableDotIndicatorColor,
                spacing: const EdgeInsets.all(Dimens.padding2),
                size: const Size.square(Dimens.size9),
                activeSize: const Size(Dimens.size18, Dimens.size9),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Dimens.radius30)),
              ),
            ),
          ],
        );
      },
    );
  }
}
