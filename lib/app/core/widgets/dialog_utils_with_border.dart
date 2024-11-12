import 'package:flutter_svg/svg.dart';

import '../../../utils/exports.dart';

class DialogUtilsWithBorder extends StatelessWidget {
  final String message;
  final TextStyle? messageStyle;
  final String? title;
  final Widget? customWidget;
  final String? okBtnTitle;
  final String? cancelBtnTitle;
  final Function()? onOkClicked;
  final Function()? onCancelClicked;
  final TextStyle? titleStyle;
  final TextStyle? okBtnTitleStyle;
  final bool isDialogHideOnClick;
  final SvgPicture? image;

  const DialogUtilsWithBorder({
    required this.message,
    required this.messageStyle,
    this.title,
    this.okBtnTitle,
    this.cancelBtnTitle,
    this.onOkClicked,
    this.isDialogHideOnClick = true,
    this.onCancelClicked,
    Key? key,
    this.titleStyle,
    this.okBtnTitleStyle,
    this.image,
    this.customWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: Dimens.elevation4,
      shape: RoundedRectangleBorder(borderRadius: Dimens.radius16.borderRadius),
      child: Container(
        constraints: const BoxConstraints(maxWidth: Dimens.space400),
        child: customWidget ??
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: Dimens.padding16),
                  child: Visibility(
                    visible: title.isNotNullOrBlank,
                    child: Column(
                      children: <Widget>[
                        image != null
                            ? Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: Dimens.space24),
                                child: image,
                              )
                            : const SizedBox(),
                        const SizedBox(height: Dimens.space16),
                        CustomTextLabelWidget(
                          label: title ?? '',
                          style: Theme.of(context)
                              .dialogTheme
                              .titleTextStyle
                              ?.copyWith(
                                height: Dimens.lineHeight1_7,
                              ),
                        ),
                        Visibility(
                            visible: message.isEmpty,
                            child: const SizedBox(height: Dimens.space16))
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: message.isNotBlank,
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: Dimens.space16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: Dimens.padding10),
                        child: CustomTextLabelWidget(
                          label: message,
                          style: Theme.of(context)
                              .dialogTheme
                              .contentTextStyle
                              ?.copyWith(
                                height: Dimens.lineHeight1_2,
                              ),
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: Dimens.space16,
                        width: Dimens.space2,
                      ),
                    ],
                  ),
                ),
                if (okBtnTitle.isNotBlank && cancelBtnTitle.isNotBlank)
                  Column(
                    children: [
                      const CustomDivider(
                        color: AppColors.lightGreyColor,
                        height: Dimens.space1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                if (isDialogHideOnClick) {
                                  goBack(context);
                                }
                                if (onCancelClicked != null) {
                                  onCancelClicked?.call();
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: Dimens.padding8),
                                child: CustomTextLabelWidget(
                                  label: cancelBtnTitle ?? "",
                                  style: okBtnTitleStyle,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            color: AppColors.mainTextBlackColor,
                            width: Dimens.space1,
                            height: Dimens.space50,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                if (isDialogHideOnClick) {
                                  goBack(context);
                                }
                                if (onOkClicked != null) onOkClicked?.call();
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: Dimens.padding8),
                                child: CustomTextLabelWidget(
                                  label: okBtnTitle ?? "",
                                  style: okBtnTitleStyle,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                else if (okBtnTitle.isNotBlank || cancelBtnTitle.isNotBlank)
                  Column(
                    children: [
                      const CustomDivider(
                        color: AppColors.mainTextBlackColor,
                        height: Dimens.space1,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (isDialogHideOnClick) {
                            goBack(context);
                          }
                          if (onOkClicked != null) onOkClicked?.call();
                        },
                        child: Container(
                          width: context.width,
                          padding: const EdgeInsets.symmetric(
                              vertical: Dimens.padding8),
                          child: CustomTextLabelWidget(
                            label: okBtnTitle ?? "",
                            style: okBtnTitleStyle,
                          ),
                        ),
                      ),
                    ],
                  )
              ],
            ),
      ),
    );
  }
}
