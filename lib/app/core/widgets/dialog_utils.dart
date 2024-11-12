import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/exports.dart';
import 'dialog_utils_with_border.dart';

class DialogUtils extends StatelessWidget {
  final String message;
  final String? title;
  final String? okBtnTitle;
  final String? cancelBtnTitle;
  final Function()? onOkClicked;
  final Function()? onCancelClicked;
  final TextStyle? titleStyle;
  final TextStyle? okBtnTitleStyle;
  final bool isDialogHideOnClick;

  const DialogUtils({
    required this.message,
    this.title,
    this.okBtnTitle,
    this.cancelBtnTitle,
    this.onOkClicked,
    this.isDialogHideOnClick = true,
    this.onCancelClicked,
    Key? key,
    this.titleStyle,
    this.okBtnTitleStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: Dimens.elevation4,
      backgroundColor: AppColors.whiteBGColor,
      shape: RoundedRectangleBorder(borderRadius: Dimens.radius12.borderRadius),
      child: Container(
        padding: const EdgeInsets.all(Dimens.padding10),
        constraints: const BoxConstraints(maxWidth: Dimens.space400),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Visibility(
              visible: title.isNotNullOrBlank,
              child: Column(
                children: <Widget>[
                  Text(
                    title ?? '',
                    style: titleStyle ?? MainConfig.textTheme.titleMedium?.copyWith(
                      color: AppColors.mainTextBlackColor,
                      fontWeight: FontWeight.w600,
                      fontSize: Dimens.fontSize18
                    ),
                  ),
                  const SizedBox(height: Dimens.space8),
                ],
              ),
            ),
            Visibility(
              visible: message.isNotBlank,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: Dimens.padding10),
                    child: CustomTextLabelWidget(
                      label: message,
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: Dimens.space10,
                    width: Dimens.space28,
                  ),
                ],
              ),
            ),
            if (okBtnTitle.isNotBlank && cancelBtnTitle.isNotBlank)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Dimens.padding14),
                      child: CustomButtonWidget(
                        textStyle: context.textTheme.titleMedium?.copyWith(
                          color: AppColors.whiteTextColor,
                          fontSize: Dimens.fontSize14
                        ),
                        text: cancelBtnTitle ?? "",
                        onClick: () async {
                          if (isDialogHideOnClick) {
                            goBack(context);
                          }
                          if (onCancelClicked != null) onCancelClicked?.call();
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Dimens.padding14),
                      child: CustomButtonWidget(
                        textStyle: context.textTheme.titleMedium?.copyWith(
                            color: AppColors.whiteTextColor,
                            fontSize: Dimens.fontSize14
                        ),
                        text: okBtnTitle ?? "",
                        onClick: () {
                          if (isDialogHideOnClick) {
                            goBack(context);
                          }
                          if (onOkClicked != null) onOkClicked?.call();
                        },
                      ),
                    ),
                  ),
                ],
              )
            else if (okBtnTitle.isNotBlank || cancelBtnTitle.isNotBlank)
              CustomButtonWidget(
                text: okBtnTitle ?? cancelBtnTitle ?? "",
                onClick: () {
                  if (isDialogHideOnClick) {
                    goBack(context);
                  }
                  if (onOkClicked != null) onOkClicked?.call();
                  if (onCancelClicked != null) onCancelClicked?.call();
                },
              ),
          ],
        ),
      ),
    );
  }
}

void showCustomDialogOld(
  String? message, {
  String? title,
  String? okBtnTitle,
  String? cancelBtnTitle,
  Function()? onOkClicked,
  Function()? onCancelClicked,
  Function(dynamic)? onBack,
  Key? key,
  bool? isDialogHideOnClick,
  TextStyle? titleStyle,
  TextStyle? okBtnTitleStyle,
}) {
  showDialog(
      context: MainConfig.context,
      builder: (context) {
        return DialogUtils(
          message: message ?? '',
          okBtnTitle: okBtnTitle,
          cancelBtnTitle: cancelBtnTitle,
          onOkClicked: onOkClicked,
          isDialogHideOnClick: isDialogHideOnClick ?? false,
          onCancelClicked: onCancelClicked,
          title: title,
          titleStyle: titleStyle,
          okBtnTitleStyle: okBtnTitleStyle,
          key: key,
        );
      }).then((value) => onBack?.call(value));
}

Future<void> showCustomDialog({
  String? message,
  String? title,
  String? okBtnTitle,
  String? cancelBtnTitle,
  bool? isDismissible,
  Function()? onOkClicked,
  Function()? onCancelClicked,
  Function(dynamic)? onBack,
  Key? key,
  Widget? customWidget,
  bool? isDialogHideOnClick,
  TextStyle? titleStyle,
  TextStyle? okBtnTitleStyle,
  TextStyle? messageStyle,
  SvgPicture? image,
}) {
  return showDialog(
      context: MainConfig.context,
      barrierColor: AppColors.lightGreyColor,
      useSafeArea: false,
      barrierDismissible: isDismissible ?? true,
      builder: (context) {
        SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
        );
        return DialogUtilsWithBorder(
          message: message ?? '',
          okBtnTitle: okBtnTitle,
          cancelBtnTitle: cancelBtnTitle,
          onOkClicked: onOkClicked,
          isDialogHideOnClick: isDialogHideOnClick ?? false,
          onCancelClicked: onCancelClicked,
          title: title,
          customWidget: customWidget,
          titleStyle: titleStyle,
          okBtnTitleStyle: okBtnTitleStyle,
          key: key,
          messageStyle: messageStyle,
          image: image,
        );
      }).then((value) => onBack?.call(value));
}


Future showCustomBottomSheet({
  required Widget builder,
  required BuildContext context,
  bool isScrollControlled = true,
  bool showDragHandle = true,
  bool useSafeArea = true,
  BoxConstraints? constraints,
  Function()? onBottomSheetClose,
}) {
  return showModalBottomSheet(
    context: context,
    showDragHandle: showDragHandle,
    isScrollControlled: isScrollControlled,
    useSafeArea: useSafeArea,
    constraints: constraints,
    builder: (context) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
      );
      return builder;
    },
  ).whenComplete(
    () {
      onBottomSheetClose?.call();
    },
  );
}

void showIOSBottomSheet({
  required BuildContext context,
  String? labelFirst,
  String? labelSecond,
  String? labelThird,
  String? cancelButtonText,
  Color? firstLabelColor,
  Color? secondLabelColor,
  Color? thirdLabelColor,
  Color? fourthLabelColor,
  bool isFourthLabelVisible = false,
  Function()? onFirstLabelTap,
  Function()? onSecondLabelTap,
  Function()? onThirdLabelTap,
  Function()? onFourthLabelTap,
}) {
  showCupertinoModalPopup(
    context: context,
    barrierDismissible: true,
    barrierColor: AppColors.colorBlack.withOpacity(0.85),
    builder: (BuildContext context) => Padding(
      padding: const EdgeInsets.only(
        left: Dimens.padding12,
        right: Dimens.padding12,
        bottom: Dimens.padding16,
      ),
      child: CupertinoActionSheet(
        actions: [
          Container(
            color: Colors.white,
            child: Column(
              children: [
                CupertinoActionSheetAction(
                  onPressed: () {
                    onFirstLabelTap?.call();
                  },
                  child: CustomTextLabelWidget(
                    label: labelFirst ?? "",
                    style: context.textTheme.titleMedium?.copyWith(
                        color: firstLabelColor,
                        fontWeight: FontWeight.w600,
                        fontSize: Dimens.fontSize16),
                  ),
                ),
                const CustomDivider(
                  height: Dimens.borderWidth1_5,
                  color: AppColors.lightGreyColor,
                ),
                CupertinoActionSheetAction(
                  onPressed: () {
                    onSecondLabelTap?.call();
                  },
                  child: CustomTextLabelWidget(
                    label: labelSecond ?? "",
                    style: context.textTheme.titleMedium?.copyWith(
                        color: secondLabelColor,
                        fontWeight: FontWeight.w600,
                        fontSize: Dimens.fontSize16),
                  ),
                ),
                const CustomDivider(
                  height: Dimens.borderWidth1_5,
                  color: AppColors.lightGreyColor,
                ),
                CupertinoActionSheetAction(
                  onPressed: () {
                    onThirdLabelTap?.call();
                  },
                  child: CustomTextLabelWidget(
                    label: labelThird ?? "",
                    style: context.textTheme.titleMedium?.copyWith(
                        color: thirdLabelColor,
                        fontWeight: FontWeight.w600,
                        fontSize: Dimens.fontSize16),
                  ),
                ),
              ],
            ),
          ),
          if (isFourthLabelVisible)
            Container(
              color: Colors.white,
              child: CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: CustomTextLabelWidget(
                  label: cancelButtonText ?? "",
                  style: context.textTheme.titleMedium?.copyWith(
                      color: fourthLabelColor,
                      fontWeight: FontWeight.w600,
                      fontSize: Dimens.fontSize16),
                ),
              ),
            ),
        ],
      ),
    ),
  );
}
