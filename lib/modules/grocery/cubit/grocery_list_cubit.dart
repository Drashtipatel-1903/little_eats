import '../../../utils/exports.dart';

class GroceryListCubit extends Cubit<GroceryListState> {

  GroceryListCubit({
    required GroceryListState initialState,
  }) : super(initialState);

  init() {
    List<LikeDislikeOption> likeDislikeOption = [
      LikeDislikeOption(title: 'Dairy', likes: 2, dislikes: 1),
      LikeDislikeOption(title: 'Breads', likes: 2, dislikes: 1),
      LikeDislikeOption(title: 'Snack', likes: 2, dislikes: 1),
      LikeDislikeOption(title: 'Meat', likes: 2, dislikes: 1),
      LikeDislikeOption(title: 'Fruit', likes: 2, dislikes: 1),
      LikeDislikeOption(title: 'Protein', likes: 2, dislikes: 1),
      LikeDislikeOption(title: 'Grains', likes: 2, dislikes: 1),
    ];

    List<ExpandedLikeDislikeOption> expandedList = [
      ExpandedLikeDislikeOption(title: 'Sweet Potatoes', isAdd: true),
      ExpandedLikeDislikeOption(
          title: 'Carrots', isDislikes: false, isLiked: false),
      ExpandedLikeDislikeOption(
          title: 'peas', isDislikes: false, isLiked: false),
    ];

    emit(state.copyWith(
        likeDislikeOption: likeDislikeOption,
        expandedLikeDislikeOption: expandedList));
  }

  void toggleExpand(int index) {
    final newIndex = (state.expandedIndex == index) ? -1 : index;
    emit(state.copyWith(expandedIndex: newIndex));
  }

  void toggleExpansion() => emit(state.copyWith());

  void toggleLikeDislike(int index) {
    if (state.expandedIndex == index) {
      emit(state.copyWith(expandedIndex: index));
    } else {
      emit(state.copyWith(expandedIndex: index));
    }
  }

  void toggleChipSelection(int index) {
    if (index >= 0 && index < state.chipItems.length) {
      final updatedChips = List<CheckboxGroupValue>.from(state.chipItems)
        ..[index] = state.chipItems[index].copyWith(
            isSelected: !(state.chipItems[index].isSelected ?? false));

      emit(state.copyWith(chipItems: updatedChips));
    } else {
      debugPrint('Error: Index $index is out of bounds for chipItems list.');
    }
  }
}
