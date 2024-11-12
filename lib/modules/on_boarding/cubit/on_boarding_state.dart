import '../../../utils/exports.dart';

class OnBoardingState extends Equatable {
  final BaseStateStatus status;
  final List<Widget> animationJsonList;
  final int currentPagerItem;

  const OnBoardingState({
    this.status = BaseStateStatus.initial,
    required this.animationJsonList,
    this.currentPagerItem = 0,
  });

  OnBoardingState copyWith({
    BaseStateStatus? status,
    List<Widget>? animationJsonList,
    int? currentPagerItem,
  }) {
    return OnBoardingState(
      status: status ?? this.status,
      animationJsonList: animationJsonList ?? this.animationJsonList,
      currentPagerItem: currentPagerItem ?? this.currentPagerItem,
    );
  }

  @override
  List<dynamic> get props => [
        status,
        animationJsonList,
        currentPagerItem,
      ];
}
