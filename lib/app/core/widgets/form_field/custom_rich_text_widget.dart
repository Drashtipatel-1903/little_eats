import '../../../../utils/exports.dart';

class CustomRichTextLabel extends StatelessWidget {
  final String primaryLabel;
  final String? strikeLabel;
  final String secondaryLabel;
  final TextStyle? primaryStyle;
  final TextStyle? strikeLabelStyle;
  final TextStyle? secondaryStyle;
  final Function? onTapSecondaryLabel;
  final Function? onTapPrimaryLabel;
  final int maxLines;
  final bool? isSpaceNeeded;

  const CustomRichTextLabel(
      {Key? key,
      this.maxLines = 2,
      this.primaryLabel = "",
      this.secondaryLabel = "",
      this.primaryStyle,
      this.onTapPrimaryLabel,
      this.onTapSecondaryLabel,
      this.secondaryStyle,
      this.isSpaceNeeded,
      this.strikeLabel,
      this.strikeLabelStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
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
          TextSpan(text: strikeLabel, style: strikeLabelStyle),
          //will add space between two line
          WidgetSpan(
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.alphabetic,
              child: SizedBox(
                height: Dimens.size16,
                width: (isSpaceNeeded ?? true) ? Dimens.padding4 : 0,
              )),
          TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  onTapSecondaryLabel?.call();
                },
              text: secondaryLabel,
              style: secondaryStyle ?? MainConfig.textTheme.titleMedium),
        ],
      ),
    );
  }
}
