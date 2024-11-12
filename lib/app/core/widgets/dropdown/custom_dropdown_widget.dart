import '../../../../utils/exports.dart';

class CustomDropDownWidget<T> extends StatelessWidget {
  final List<T> list;
  final T value;
  final String Function(T) label;
  final bool? isExpanded;

 const CustomDropDownWidget(
      {Key? key,
      required this.list,
      required this.value,
      required this.label,
      this.isExpanded})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.lightGrayBGColor),
          borderRadius: Dimens.radius4.borderRadius),
      // padding: const EdgeInsets.only(left: Dimens.padding14, right: Dimens.padding14),
      child: DropdownButton<T>(
        padding: EdgeInsets.zero,
        dropdownColor: AppColors.whiteBGColor,
        value: value,
        isExpanded: isExpanded ?? false,
        underline: const SizedBox(),
        elevation: Dimens.elevation2.toInt(),
        icon: const Icon(
          Icons.keyboard_arrow_down,
          color: AppColors.lightGrayBGColor,
        ),
        onChanged: (T? newValue) {},
        items: list.map<DropdownMenuItem<T>>((T value) {
          return DropdownMenuItem<T>(
            value: value,
            child: Padding(
              padding: Dimens.padding14.padding,
              child: CustomTextLabelWidget(label: label(value)),
            ),
          );
        }).toList(),
      ),
    );
  }
}
