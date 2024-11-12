import '../../../utils/exports.dart';

class CustomSnackBarWidget extends StatelessWidget {
  final String message;
  final SvgGenImage? icon;
  final String? buttonText;
  final Function()? onButtonClick;

  const CustomSnackBarWidget(
      {required this.message,
      this.icon,
      this.buttonText,
      this.onButtonClick,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon != null
            ? Padding(
                padding: const EdgeInsets.only(right: Dimens.padding8),
                child: icon?.svg(
                  height: Dimens.size16,
                  width: Dimens.size16,
                ),
              )
            : Container(),
        Flexible(
          child: CustomTextLabelWidget(
            textAlign: icon != null ? TextAlign.left : TextAlign.center,
            maxLines: Dimens.maxLines02,
            label: message,
            style: MainConfig.textTheme.bodyMedium
                ?.copyWith(fontSize: Dimens.fontSize14),
          ),
        )
      ],
    );
  }
}

/// snackBar
///
/// [message] display message
/// [buttonText] String for button
/// [duration] Duration of SnackBar display
/// [isDismissible] value for dismiss snackbar
/// [icon] display icon before message
void displaySnackBar(String message, BuildContext context,
    {SvgGenImage? icon,
    String buttonText = "",
    Function()? onButtonClick,
    Duration? duration,
    bool? isDismissible}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    margin: const EdgeInsets.only(
        left: Dimens.space28, right: Dimens.space28, bottom: Dimens.space28),
    duration: duration ?? const Duration(seconds: Dimens.duration3),
    shape: RoundedRectangleBorder(borderRadius: Dimens.radius10.borderRadius),
    content: CustomSnackBarWidget(
      message: message,
      icon: icon,
      buttonText: buttonText,
      onButtonClick: onButtonClick,
    ),
    backgroundColor: AppColors.lightGrayBGColor,
  ));
}
