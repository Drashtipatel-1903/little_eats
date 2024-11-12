import '../../../utils/exports.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState(status: BaseStateStatus.initial));

  init() {
    initializeVideoPlayer();
  }

  /// Initializes the video player and updates the state with the controller.
  Future<void> initializeVideoPlayer() async {
    final controller = VideoPlayerController.asset(Assets.mp4.icSplash);

    await controller.initialize();

    // Play the video and emit the updated state with the initialized controller
    controller.play();
    emit(state.copyWith(
        status: BaseStateStatus.success, controller: controller));

    // Handle video end and navigation
    controller.addListener(() {
      if (controller.value.position == controller.value.duration) {
        MainConfig.context.router.replaceAll([const OnBoardingRoute()]);
      }
    });
  }

  @override
  Future<void> close() {
    state.controller?.dispose();
    return super.close();
  }
}
