import '../../../utils/exports.dart';

class SplashState extends Equatable {
  final BaseStateStatus status;
  final VideoPlayerController? controller;

  const SplashState({
    this.status = BaseStateStatus.initial,
    this.controller,
  });

  SplashState copyWith({
    BaseStateStatus? status,
    LoginLocal? loginLocal,
    bool? onChange,
    VideoPlayerController? controller,
  }) {
    return SplashState(
      status: status ?? this.status,
      controller: controller ?? this.controller,
    );
  }

  @override
  List<dynamic> get props => [status, controller];
}
