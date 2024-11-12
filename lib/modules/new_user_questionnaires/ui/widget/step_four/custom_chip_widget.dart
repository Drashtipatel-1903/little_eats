import '../../../../../utils/exports.dart';

class CustomChipWidget extends StatelessWidget {
  final String title;
  final List<CheckboxGroupValue> chipItems;
  final Function(int index, bool selected) onChipsTap;
  final bool showCheckmark;


  const CustomChipWidget({
    Key? key,
    required this.title,
    required this.chipItems,
    required this.onChipsTap,
    this.showCheckmark = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomTextLabelWidget(
          label: title,
          style: context.textTheme.titleMedium?.copyWith(
            fontSize: Dimens.fontSize14,
            color: AppColors.mainTextBlackColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: Dimens.padding8),
        Wrap(
          spacing: Dimens.space8,
          runSpacing: Dimens.space4,
          children: chipItems.asMap().entries.map((entry) {
            int index = entry.key;
            CheckboxGroupValue chipModel = entry.value;
            return ChoiceChip(
              padding: const EdgeInsets.symmetric(horizontal: Dimens.padding10, vertical: Dimens.padding8),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: (chipModel.isSelected ?? false)
                      ? AppColors.primary
                      : AppColors.lightGreyColor,
                ),
                borderRadius: BorderRadius.circular(Dimens.radius8),
              ),
              backgroundColor: AppColors.whiteBGColor,
              selectedColor: AppColors.primary,
              showCheckmark: showCheckmark,
              checkmarkColor: AppColors.whiteBGColor,
              selected: chipModel.isSelected ?? false,
              label: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (chipModel.icon != null && (showCheckmark != true))
                    const Icon(
                      Icons.check,
                      size: Dimens.iconSize24,
                      color: AppColors.whiteTextColor,
                    ),
                  SizedBox(width: chipModel.icon != null ? Dimens.space6 : Dimens.padding0),
                  CustomTextLabelWidget(
                    label: chipModel.label ?? "",
                    style: AppStyles.textTheme.headlineSmall?.copyWith(
                      fontSize: Dimens.fontSize14,
                      color: (chipModel.isSelected ?? false)
                          ? AppColors.whiteBGColor
                          : AppColors.primary,
                    ),
                  ),
                ],
              ),
              onSelected: (selected) {
                onChipsTap(index, selected);
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
