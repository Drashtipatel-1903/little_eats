import 'package:flutter_svg/svg.dart';

class CheckboxGroupValue {
  final String? label;
  final String? title;
  final String? value;
  bool? isSelected;
  bool? isShowCheckMark;
  final SvgPicture? icon;

  CheckboxGroupValue({
    this.label,
    this.title,
    this.value,
    this.isSelected,
    this.isShowCheckMark = false,
    this.icon,
  });

  factory CheckboxGroupValue.fromJson(Map<String, dynamic> json) {
    return CheckboxGroupValue(
      label: json['label'],
      title: json['title'],
      value: json['value'],
      isSelected: json['isSelected'],
      isShowCheckMark: json['isShowCheckMark'],
      icon: json['icon'], // Assuming icon data is correctly provided in JSON
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'title': title,
      'value': value,
      'isSelected': isSelected,
      'isShowCheckMark': isShowCheckMark,
      'icon': icon,
    };
  }

  CheckboxGroupValue copyWith({
    String? label,
    String? title,
    String? value,
    bool? isSelected,
    bool? isShowCheckMark,
    SvgPicture? icon,
  }) {
    return CheckboxGroupValue(
      label: label ?? this.label,
      title: title ?? this.title,
      value: value ?? this.value,
      isSelected: isSelected ?? this.isSelected,
      isShowCheckMark: isShowCheckMark ?? this.isShowCheckMark,
      icon: icon ?? this.icon,
    );
  }
}
