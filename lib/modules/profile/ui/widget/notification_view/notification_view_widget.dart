import '../../../../../utils/exports.dart';

class NotificationViewWidget extends StatelessWidget {
  const NotificationViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomTextLabelWidget(
          label: context.appString.pushNotificationKey,
          style: context.textTheme.titleMedium?.copyWith(
            color: AppColors.mainTextBlackColor,
            fontSize: Dimens.fontSize15,
            fontWeight: FontWeight.w700,
          ),
        ),
        CustomSwitch(
          onChanged: (p0) {},
          switchValue: false,
        )
      ],
    );
  }
}
