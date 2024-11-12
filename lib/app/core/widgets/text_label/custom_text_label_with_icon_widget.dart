import '../../../../utils/exports.dart';

class CustomTextLabelWithIcon extends StatelessWidget {
  final String label;
  final TextStyle? style;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextAlign? textAlign;
  final SvgGenImage? image;
  final Color? imageColor;
  final Size? size;
  final bool isPrefix, isSuffix;
  final EdgeInsetsGeometry iconPadding;
  final Function()? onTap;

  final MainAxisAlignment mainAxisAlignment;

  const CustomTextLabelWithIcon(
      {Key? key,
      this.label = "",
      this.style,
      this.mainAxisAlignment = MainAxisAlignment.start,
      this.isPrefix = false,
      this.isSuffix = false,
      this.overflow,
      this.onTap,
      this.iconPadding =
          const EdgeInsets.only(left: Dimens.padding8, right: Dimens.padding8),
      this.image,
      this.imageColor,
      this.maxLines,
      this.size = const Size(Dimens.size14, Dimens.size14),
      this.textAlign = TextAlign.center})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent, // Removes the splash effect
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          Visibility(
            visible: image != null && isPrefix,
            child: Padding(
              padding: iconPadding,
              child: image?.svg(
                height: size?.height,
                width: size?.width,
                colorFilter: ColorFilter.mode(
                  imageColor ?? AppColors.transparent,
                  BlendMode.srcATop,
                ),
              ),
            ),
          ),
          Expanded(
            flex:
                maxLines != null && maxLines! > 1 ? 1 : (image == null ? 1 : 0),
            child: CustomTextLabelWidget(
              label: label,
              style: style ??
                  MainConfig.textTheme.titleMedium
                      ?.copyWith(color: AppColors.blackTextColor),
              overflow: overflow,
              maxLines: maxLines,
              textAlign: textAlign,
            ),
          ),
          Visibility(
            visible: image != null && isSuffix,
            child: Padding(
              padding: iconPadding,
              child: image?.svg(
                height: size?.height,
                width: size?.width,
                colorFilter: ColorFilter.mode(
                  imageColor ?? AppColors.transparent,
                  BlendMode.srcATop,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
