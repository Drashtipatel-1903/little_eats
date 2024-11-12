import 'package:flutter/cupertino.dart';
import '../../../../utils/exports.dart';

class CustomSwitch extends StatelessWidget {
  final bool? switchValue;
  final Function(bool) onChanged;
  final double scale;

  const CustomSwitch({
    super.key,
    this.switchValue,
    required this.onChanged,
    this.scale = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale, // Scale the switch
      child: CupertinoSwitch(
        value: switchValue ?? false,
        activeColor: AppColors.primary,
        onChanged: onChanged,
      ),
    );
  }
}
