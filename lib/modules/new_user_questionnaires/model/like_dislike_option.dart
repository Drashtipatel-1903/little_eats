class LikeDislikeOption {
  final String title;
  bool isLiked;
  bool isDislikes;
  int likes;
  int dislikes;
  bool isExpanded;
  final List<LikeDislikeOption> expandedOptions; // Add this field

  LikeDislikeOption({
    required this.title,
    this.isLiked = false,
    this.isDislikes = false,
    this.likes = 0,
    this.dislikes = 0,
    this.isExpanded = false,
    this.expandedOptions = const [],
  });

  LikeDislikeOption copyWith({
    String? title,
    int? likes,
    int? dislikes,
    bool? isExpanded,
    List<LikeDislikeOption>? expandedOptions,
    bool? isLiked,
    bool? isDislikes,
  }) {
    return LikeDislikeOption(
      title: title ?? this.title,
      dislikes: dislikes ?? this.dislikes,
      isLiked: isLiked ?? this.isLiked,
      isDislikes: isDislikes ?? this.isDislikes,
      likes: likes ?? this.likes,
      isExpanded: isExpanded ?? this.isExpanded,
      expandedOptions: expandedOptions ?? this.expandedOptions,
    );
  }
}
