class AllergyOption {
  final String title;
  bool isSelected;

  AllergyOption({
    required this.title,
    this.isSelected = false,
  });

  AllergyOption copyWith({
    String? title,
    bool? isSelected,
  }) {
    return AllergyOption(
      title: title ?? this.title,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}


