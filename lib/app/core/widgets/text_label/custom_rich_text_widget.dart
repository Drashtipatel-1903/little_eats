import '../../../../utils/exports.dart';

class CustomRichTextLabel extends StatelessWidget {
  final String primaryLabel;
  final String? strikeLabel;
  final String secondaryLabel;
  final TextStyle? primaryStyle;
  final TextAlign? textAlign;
  final TextStyle? strikeLabelStyle;
  final TextStyle? secondaryStyle;
  final Function? onTapSecondaryLabel;
  final Function? onTapPrimaryLabel;
  final int maxLines;
  final bool? isSpaceNeeded;

  const CustomRichTextLabel({
    Key? key,
    this.maxLines = 2,
    this.primaryLabel = "",
    this.secondaryLabel = "",
    this.primaryStyle,
    this.onTapPrimaryLabel,
    this.onTapSecondaryLabel,
    this.secondaryStyle,
    this.isSpaceNeeded,
    this.textAlign = TextAlign.start,
    this.strikeLabel,
    this.strikeLabelStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: _getTextAlignment(textAlign),
      child: RichText(
        textAlign: textAlign ?? TextAlign.start,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              onTapPrimaryLabel?.call();
            },
          text: primaryLabel,
          style: primaryStyle ??
              MainConfig.textTheme.titleMedium
                  ?.copyWith(color: AppColors.whiteTextColor),
          children: [
            // Strike-through text
            if (strikeLabel != null)
              TextSpan(text: strikeLabel, style: strikeLabelStyle),

            // Space between lines if needed
            WidgetSpan(
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.alphabetic,
              child: SizedBox(
                height: Dimens.size16,
                width: (isSpaceNeeded ?? true) ? Dimens.padding4 : 0,
              ),
            ),

            // Secondary label text
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  onTapSecondaryLabel?.call();
                },
              text: secondaryLabel,
              style: secondaryStyle ?? MainConfig.textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }

  /// Helper function to align text in the container
  AlignmentGeometry _getTextAlignment(TextAlign? textAlign) {
    switch (textAlign) {
      case TextAlign.center:
        return Alignment.center;
      case TextAlign.right:
        return Alignment.centerRight;
      case TextAlign.left:
        return Alignment.centerLeft;
      case TextAlign.start:
        return AlignmentDirectional.centerStart;
      case TextAlign.end:
        return AlignmentDirectional.centerEnd;
      default:
        return Alignment.centerLeft;
    }
  }
}
