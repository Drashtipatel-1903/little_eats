import '../../../utils/exports.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  final formKey = GlobalKey<FormState>();

  OnBoardingCubit({
    required OnBoardingState initialState,
  }) : super(initialState);

  init() {
    List<Widget> updatedAnimationJsonList = List.from(state.animationJsonList);
    updatedAnimationJsonList.addAll(addOnBoardingPagerList());
    emit(state.copyWith(animationJsonList: updatedAnimationJsonList));
  }

  void onPageChanged(int index) {
    emit(state.copyWith(currentPagerItem: index));
  }

  handleNewToLittleEatsRedirection(BuildContext context) {
    context.router.pushNamed(AppPaths.newUserQuestionnaires);
  }

  handleAlreadyHaveAccountRedirection(BuildContext context) {
    context.router.pushNamed(AppPaths.login);
  }
}
