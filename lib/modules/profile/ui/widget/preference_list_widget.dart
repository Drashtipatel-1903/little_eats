import '../../../../../../utils/exports.dart';

class PreferenceListWidget extends StatelessWidget {
  final String? title;
  final String? forwardIcon;
  final VoidCallback? onIconTap;
  final String? notificationIcon;
  final bool? isNotificationVisible;
  final VoidCallback? onNotificationTap;

  const PreferenceListWidget({
    super.key,
    this.title,
    this.forwardIcon,
    this.onIconTap,
    this.onNotificationTap,
    this.notificationIcon,
    this.isNotificationVisible = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: Dimens.space10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title ?? '',
              style: context.textTheme.titleMedium?.copyWith(
                  color: AppColors.primary,
                  fontSize: Dimens.fontSize15,
                  fontWeight: FontWeight.w600),
            ),
            InkWell(
              onTap: () {
                if (onIconTap != null) {
                  onIconTap!();
                }
              },
              child: Assets.svgs.icBackForward.svg(
                  colorFilter: const ColorFilter.mode(
                      AppColors.primary, BlendMode.srcIn)),
            ),
            if (isNotificationVisible ?? false)
              InkWell(
                onTap: () {
                  if (onNotificationTap != null) {
                    onNotificationTap!();
                  }
                },
                child: Assets.svgs.icSwitch.svg(),
              ),
          ],
        ),
        const SizedBox(
          height: Dimens.space10,
        ),
        const CustomDivider(
          height: Dimens.borderWidth1_5,
          color: AppColors.containerBorderColor,
        )
      ],
    );
  }
}
