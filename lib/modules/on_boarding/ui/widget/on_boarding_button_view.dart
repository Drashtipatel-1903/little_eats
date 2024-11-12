import '../../../../utils/exports.dart';

class OnBoardingButtonView extends StatelessWidget {
  const OnBoardingButtonView({super.key});

  @override
  Widget build(BuildContext context) {
    final onBoardingCubit = context.read<OnBoardingCubit>();

    return Column(
      children: [
        const SizedBox(
          height: Dimens.space12,
        ),
        BlocListener<OnBoardingCubit, OnBoardingState>(
          listener: (ctx, state) {},
          child: CustomButtonWidget(
            onClick: () {
              onBoardingCubit.handleNewToLittleEatsRedirection(context);
            },
            text: context.appString.newToLittleEatsKey,
            backgroundColor: AppColors.primary,
            textStyle: context.textTheme.titleMedium?.copyWith(
                color: AppColors.whiteBGColor, fontSize: Dimens.fontSize16),
          ),
        ),
        const SizedBox(
          height: Dimens.space8,
        ),

        /// Already Have an account Button
        BlocListener<OnBoardingCubit, OnBoardingState>(
          listener: (ctx, state) {},
          child: CustomOutlineButton(
            onTap: () {
              onBoardingCubit.handleAlreadyHaveAccountRedirection(context);
            },
            title: context.appString.iAlreadyHaveAnAccountKey,
            backgroundColor: AppColors.primary,
            titleTextStyle: context.textTheme.titleMedium?.copyWith(
                color: AppColors.whiteBGColor, fontSize: Dimens.fontSize16),
          ),
        ),
        const SizedBox(
          height: Dimens.space12,
        ),
      ],
    );
  }
}
