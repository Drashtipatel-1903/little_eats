import '../../../../utils/exports.dart';

class CustomUnderlineTextWidget extends StatelessWidget {
  final String title;
  final Function onTap;
  final TextStyle? titleTextStyle;
  final Color? textDefaultColor;
  final Color? underlineColor;
  final double? underLineThickness;
  final double? width;

  const CustomUnderlineTextWidget({
    Key? key,
    required this.title,
    required this.onTap,
    this.titleTextStyle,
    this.textDefaultColor,
    this.underlineColor,
    this.underLineThickness = Dimens.thick205,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap as void Function()?,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        alignment: Alignment.center,
      ).copyWith(
          overlayColor: WidgetStateProperty.all(
            Colors.transparent,
          )),
      child: CustomTextLabelWidget(
        label: title,
        textAlign: TextAlign.center,
        style: titleTextStyle ??
            MainConfig.textTheme.bodyMedium?.copyWith(
              decoration: TextDecoration.underline,
              decorationThickness: underLineThickness,
              decorationColor: underlineColor ?? AppColors.mediumGrayBGColor,
            ),
      ),
    );
  }
}
