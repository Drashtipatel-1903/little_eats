import '../../../../utils/exports.dart';

class CustomButtonWidget extends StatelessWidget {
  final Color backgroundColor;
  final TextStyle? textStyle;
  final String text;
  final Function()? onClick;
  final Key? key1;
  final double? width;
  final bool isDisable;
  final double borderRadius;
  final double elevation;  // Add this line

  const CustomButtonWidget({
    this.backgroundColor = AppColors.blueBGColor,
    this.width = double.infinity,
    this.text = "",
    this.isDisable = false,
    this.onClick,
    this.key1,
    this.textStyle,
    this.borderRadius = Dimens.radius8,
    this.elevation = 0, // Default value for elevation is 0 (no shadow)
  }) : super(key: key1);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.symmetric(vertical: Dimens.padding12)),
          backgroundColor: WidgetStateProperty.all<Color>(
              isDisable ? AppColors.lightGrayBGColor : backgroundColor),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: const BorderSide(color: AppColors.primary),
            ),
          ),
          elevation: WidgetStateProperty.all<double>(elevation),  // Apply elevation here
        ),
        onPressed: isDisable
            ? null
            : () {
          hideKeyboard();
          onClick?.call();
        },
        child: CustomTextLabelWidget(
          label: text,
          style: textStyle ??
              Theme.of(MainConfig.context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: AppColors.whiteTextColor),
        ),
      ),
    );
  }
}
