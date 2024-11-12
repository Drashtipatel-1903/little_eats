import '../../../utils/exports.dart';

class AddBreakfastState extends Equatable {
  final BaseStateStatus status;
  final int currentPagerItem;
  final int currentStep;

  final List<LikeDislikeOption> likeDislikeOption;
  final List<ExpandedLikeDislikeOption> expandedLikeDislikeOption;
  final int? expandedIndex;
  final bool isNextButtonDisable;
  final bool isExpanded;
  final bool isSelected;
  final List<CheckboxGroupValue> chipItems;

  AddBreakfastState({
    this.status = BaseStateStatus.initial,
    this.currentPagerItem = 0,
    this.currentStep = 1,
    DateTime? fromDate,
    this.likeDislikeOption = const [],
    this.chipItems = const [],
    this.expandedLikeDislikeOption = const [],
    this.expandedIndex = -1,
    this.isNextButtonDisable = true,
    this.isSelected = false,
    this.isExpanded = false,
  });

  AddBreakfastState copyWith({
    BaseStateStatus? status,
    int? currentPagerItem,
    int? currentStep,
    List<LikeDislikeOption>? likeDislikeOption,
    List<ExpandedLikeDislikeOption>? expandedLikeDislikeOption,
    List<CheckboxGroupValue>? chipItems,
    int? expandedIndex,
    bool? isNextButtonDisable,
    bool? isSelected,
    bool? isExpanded,
  }) {
    return AddBreakfastState(
      status: status ?? this.status,
      currentPagerItem: currentPagerItem ?? this.currentPagerItem,
      currentStep: currentStep ?? this.currentStep,
      expandedIndex: expandedIndex ?? this.expandedIndex,
      chipItems: chipItems ?? this.chipItems,
      isNextButtonDisable: isNextButtonDisable ?? this.isNextButtonDisable,
      isSelected: isSelected ?? this.isSelected,
      isExpanded: isExpanded ?? this.isExpanded,
      likeDislikeOption: likeDislikeOption ?? this.likeDislikeOption,
      expandedLikeDislikeOption:
          expandedLikeDislikeOption ?? this.expandedLikeDislikeOption,
    );
  }

  @override
  List<dynamic> get props => [
        status,
        currentPagerItem,
        currentStep,
        likeDislikeOption,
        expandedLikeDislikeOption,
        expandedIndex,
        isNextButtonDisable,
        isExpanded,
      ];
}
