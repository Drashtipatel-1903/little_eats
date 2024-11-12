import '../../../../utils/exports.dart';

class CustomRoundedButtonWidget extends StatelessWidget {
  final Color backgroundColor;
  final TextStyle? textStyle;
  final String text;
  final Function()? onClick;
  final Key? key1;
  final double? width;
  final bool isDisable;
  final double borderRadius;
  final SvgGenImage? icon;
  final double iconSize;

  const CustomRoundedButtonWidget({
    this.backgroundColor = AppColors.blueBGColor,
    this.width,
    this.text = "",
    this.isDisable = false,
    this.onClick,
    this.key1,
    this.textStyle,
    this.borderRadius = Dimens.radius24,
    this.icon,
    this.iconSize = 24.0,
  }) : super(key: key1);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.symmetric(vertical: Dimens.padding8)),
          backgroundColor: WidgetStateProperty.all<Color>(
              isDisable ? AppColors.lightGrayBGColor : backgroundColor),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
        onPressed: isDisable
            ? null
            : () {
          hideKeyboard();
          onClick?.call();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextLabelWidget(
              label: text,
              style: textStyle ??
                  Theme.of(MainConfig.context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(color: AppColors.whiteTextColor),
            ),
            const SizedBox(width: Dimens.padding12),
            if (icon != null) ...[
              icon!.svg(
                height: iconSize,
                width: iconSize,
                color: textStyle?.color ?? AppColors.whiteTextColor,
              ),
              const SizedBox(width: Dimens.padding8),
            ],
          ],
        ),
      ),
    );
  }
}
