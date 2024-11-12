import '../../../../utils/exports.dart';

class CustomRadioButtonWidget extends StatelessWidget {
 final dynamic value;
 final dynamic groupValue;
 final Function(dynamic) onChange;
 final String? label;

 const CustomRadioButtonWidget(
      {Key? key,
      required this.value,
      required this.groupValue,
      this.label = "",
      required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      value: value,
      groupValue: groupValue,
      onChanged: onChange,
      title: CustomTextLabelWidget(
        label: label ?? "",
        textAlign: TextAlign.start,
        style: MainConfig.textTheme.bodyMedium,
      ),
    );
  }
}
