import '../../../utils/exports.dart';

class GroceryListState extends Equatable {
  final BaseStateStatus status;

  final List<LikeDislikeOption> likeDislikeOption;
  final List<ExpandedLikeDislikeOption> expandedLikeDislikeOption;
  final int? expandedIndex;
  final bool isExpanded;
  final bool isSelected;
  final List<CheckboxGroupValue> chipItems;

  const GroceryListState({
    this.status = BaseStateStatus.initial,
    DateTime? fromDate,
    this.likeDislikeOption = const [],
    this.chipItems = const [],
    this.expandedLikeDislikeOption = const [],
    this.expandedIndex = -1,
    this.isSelected = false,
    this.isExpanded = false,
  });

  GroceryListState copyWith({
    BaseStateStatus? status,
    List<LikeDislikeOption>? likeDislikeOption,
    List<ExpandedLikeDislikeOption>? expandedLikeDislikeOption,
    List<CheckboxGroupValue>? chipItems,
    int? expandedIndex,
    bool? isSelected,
    bool? isExpanded,
  }) {
    return GroceryListState(
      status: status ?? this.status,
      expandedIndex: expandedIndex ?? this.expandedIndex,
      chipItems: chipItems ?? this.chipItems,
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
        likeDislikeOption,
        expandedLikeDislikeOption,
        expandedIndex,
        isExpanded,
      ];
}
