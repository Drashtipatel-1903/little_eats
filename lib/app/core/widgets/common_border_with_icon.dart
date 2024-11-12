import 'package:flutter_svg/svg.dart';
import '../../../../utils/exports.dart';

class CommonBorderWithIcon extends StatelessWidget {
  final String title;
  final String icon;
  final Function(int index, bool selected) onTap;

  const CommonBorderWithIcon({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(0, true),
      child: Container(
        padding: const EdgeInsets.all(Dimens.padding8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.radius8),
          border: Border.all(color: AppColors.containerBorderColor),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.centerRight,
                child: SvgPicture.asset(
                  icon,
                  width: Dimens.iconSize38,
                  height: Dimens.iconSize38,
                ),
              ),
            ),
            const SizedBox(
              width: Dimens.space16,
            ),
            Expanded(
              flex: 3,
              child: CustomTextLabelWidget(
                label: title,
              
                textAlign: TextAlign.start,
                style: context.textTheme.titleMedium?.copyWith(
                  color: AppColors.mainTextBlackColor,
                  fontSize: Dimens.fontSize16,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
