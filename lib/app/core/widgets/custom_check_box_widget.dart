import 'package:flutter_svg/svg.dart';

import '../../../utils/exports.dart';

class CustomCheckBoxWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? fillColor;
  final Color? borderColor;
  final Color? iconColor;
  final BorderRadius? borderRadius;
  final Function(bool)? onCheck;
  final String? title;
  final bool isChecked;

  const CustomCheckBoxWidget({
    super.key,
    this.height,
    this.width,
    this.onCheck,
    this.fillColor,
    this.iconColor,
    this.title,
    this.borderColor,
    this.isChecked = false,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onCheck?.call(!isChecked);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: Dimens.padding10),
        decoration: BoxDecoration(
          borderRadius: Dimens.radius8.borderRadius,
          border: Border.all(
            width: Dimens.borderWidth1,
            color: AppColors.containerBorderColor,
          ),
        ),
        padding: const EdgeInsets.all(Dimens.padding14),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextLabelWidget(
              label: title ?? '',
              textAlign: TextAlign.start,
              style: context.textTheme.titleMedium?.copyWith(
                color: AppColors.mainTextBlackColor,
                fontSize: Dimens.fontSize14,
                fontWeight: FontWeight.w600,
              ),
              maxLines: Dimens.maxLines02,
              overflow: TextOverflow.ellipsis,
            ),
            SvgPicture.asset(
              isChecked
                  ? Assets.svgs.icCheckedBox.path
                  : Assets.svgs.icCheckbox.path,
              width: Dimens.space24,
              height: Dimens.space24,
            ),
          ],
        ),
      ),
    );
  }
}
