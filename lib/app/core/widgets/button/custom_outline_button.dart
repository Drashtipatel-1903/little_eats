import '../../../../utils/exports.dart';

class CustomOutlineButton extends StatelessWidget {
  final String? title;
  final SvgGenImage? prefixIcon;
  final TextStyle? titleTextStyle;
  final void Function()? onTap;
  final Color backgroundColor;
  final Color? disabledColor;
  final Color titleColor;
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;
  final bool isEnabled;
  final double? height;
  final SvgGenImage? suffixIcon;
  final double? width;
  final double? iconPadding;
  final double? elevation;
  final double imageWidth;
  final double imageHeight;
  final double? suffixImageWidth;
  final double? suffixImageHeight;
  final double? predixImageWidth;
  final double? prefixImageHeight;
  final int textFlex;
  final EdgeInsets? contentPadding;

  const CustomOutlineButton({
    this.title,
    this.prefixIcon,
    this.titleTextStyle,
    this.onTap,
    Color? backgroundColor,
    this.disabledColor,
    this.titleColor = Colors.white,
    Color? borderColor,
    this.borderWidth = 0,
    this.borderRadius = Dimens.radius8,
    this.isEnabled = true,
    this.height,
    this.width,
    this.imageHeight = Dimens.iconSize18,
    this.imageWidth = Dimens.iconSize18,
    this.textFlex = 0,
    super.key,
    this.elevation,
    this.iconPadding,
    this.suffixImageWidth,
    this.suffixImageHeight,
    this.predixImageWidth,
    this.prefixImageHeight,
    this.suffixIcon,
    this.contentPadding,
  })  : backgroundColor = AppColors.primary,
        borderColor = AppColors.primary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width ?? double.infinity,
      child: OutlinedButton(
        style: Theme.of(context).outlinedButtonTheme.style?.copyWith(
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          alignment: Alignment.center,
          side: WidgetStatePropertyAll(BorderSide(
            color: borderColor,
            width: borderWidth,
          )),
          padding: WidgetStatePropertyAll(
            title?.isEmpty ?? true
                ? const EdgeInsets.all(Dimens.padding0)
                : const EdgeInsets.symmetric(
              horizontal: Dimens.padding12, vertical: Dimens.padding8,
            ),
          ),
          elevation: WidgetStatePropertyAll(elevation),
          textStyle: WidgetStatePropertyAll(titleTextStyle),
        ),
        onPressed: isEnabled ? onTap : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (prefixIcon != null) ...[
              prefixIcon!.svg(
                width: predixImageWidth,
                height: prefixImageHeight,
              ),
              SizedBox(width: iconPadding ?? 0),
            ],
            Flexible(
              flex: textFlex,
              child: Text(
                title ?? "",
                style: (titleTextStyle ??
                    Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: Dimens.fontSize16,
                        color: AppColors.blueColor))
                    ?.apply(
                  color: !isEnabled
                      ? AppColors.disableTextColor
                      : AppColors.blueColor,
                ),
              ),
            ),
            if (suffixIcon != null) ...[
              SizedBox(width: iconPadding ?? 0),
              suffixIcon!.svg(
                width: suffixImageWidth,
                height: suffixImageHeight,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
