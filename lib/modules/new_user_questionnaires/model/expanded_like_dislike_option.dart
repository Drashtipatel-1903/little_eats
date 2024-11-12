class ExpandedLikeDislikeOption {
  final String? title;
  final String? qty;
  bool isLiked;
  bool isDislikes;
  bool isAdd;
  bool isImageVisible;
  bool isCheckboxVisible;
  bool isQuantityVisible;

  ExpandedLikeDislikeOption({
    required this.title,
    this.qty,
    this.isLiked = false,
    this.isDislikes = false,
    this.isAdd = false,
    this.isImageVisible = false,
    this.isCheckboxVisible = false,
    this.isQuantityVisible = false,
  });

  ExpandedLikeDislikeOption copyWith({
    String? title,
    String? qty,
    bool? isLiked,
    bool? isDislikes,
    bool? isAdd,
    bool? isImageVisible,
    bool? isCheckboxVisible,
    bool? isQuantityVisible,
  }) {
    return ExpandedLikeDislikeOption(
      title: title ?? this.title,
      qty: qty ?? this.qty,
      isLiked: isLiked ?? this.isLiked,
      isDislikes: isDislikes ?? this.isDislikes,
      isAdd: isAdd ?? this.isAdd,
      isImageVisible: isImageVisible ?? this.isImageVisible,
      isCheckboxVisible: isCheckboxVisible ?? this.isCheckboxVisible,
      isQuantityVisible: isQuantityVisible ?? this.isQuantityVisible,
    );
  }
}
