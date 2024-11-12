import '../../../../utils/exports.dart';

/// Custom TextField
class CustomTextFormFieldWidget extends StatelessWidget {
  ///[label] will be display in text field
  final String label;

  ///[prefixText] will be display in text field
  final String? prefixText;

  ///[suffixText] will be display in text field
  final String? suffixText;

  ///[validator] form filed validator will pass validation method
  final FormFieldValidator? validator;

  ///[focusNode] FocusNode for TextField
  final FocusNode? focusNode;

  ///[autoFocus] focus on the TextField as soon as it’s visible
  final bool? autoFocus;

  ///[controller] controller for textfield
  final TextEditingController controller;

  ///[onChange] onchange method
  final ValueChanged<String>? onChange;

  ///[textInputType] give the type of text input in textfield
  final TextInputType? textInputType;

  ///[prefix] Custom Widget for  prefix
  final Widget? prefix;

  ///[prefixIcon] SvgGenImage to be shown as prefix.
  final SvgGenImage? prefixIcon;

  ///[maxLength] maxlength of Text
  final int? maxLength;

  ///[maxLines] maximum line of Text
  final int? maxLines;

  ///[suffixOnClick] Suffix Widget Click Event
  final Function()? suffixOnClick;

  final Function()? prefixOnClick;

  ///[hint] hint text
  final String? hint;

  ///[hintStyle] Style for hint in textField
  final TextStyle? hintStyle;

  /// [input] type of keyboard button like go, next, done
  final TextInputAction? input;

  ///[obscureText] is Sequrity on or off
  final bool? obscureText;

  /// [prefixIconSize] size of prefix
  final Size? prefixIconSize;

  /// [suffixIconSize] size of prefix
  final Size? suffixIconSize;

  /// [prefixIconConstraints] BoxConstraints of prefix
  final BoxConstraints? prefixIconConstraints;

  /// [suffixIconConstraints] BoxConstraints of suffix
  final BoxConstraints? suffixIconConstraints;

  final Key? formFieldKey;

  ///[suffix] custom widget for suffix
  final Widget? suffix;

  ///[inputFormatters] validator for entering value in text field
  final List<TextInputFormatter>? inputFormatters;

  ///[style] style for text in text field
  final TextStyle? style;

  ///[suffixIcon] SvgGenImage to be shown as suffix icon
  final SvgGenImage? suffixIcon;

  ///[isEditable] value for enable and disable text field
  final bool? isEditable;

  ///[borderColor] bordercolor for textfield
  final Color? borderColor;

  ///[prefixIconColor] prefix Icon Color
  final Color? prefixIconColor;

  ///[errorStyle] Style for Error
  final TextStyle? errorStyle;

  ///[floatingStyle] Style of Floating label
  final TextStyle? floatingStyle;

  ///[onTextSubmit] onTextSubmit of text field
  final Function(String)? onTextSubmit;

  ///[cursorColor] Color for Cursor
  final Color? cursorColor;

  ///[textAlign] Color for Cursor
  final TextAlign? textAlign;

  ///[GestureTapCallback]  on tap of text field
  final GestureTapCallback? onTap;

  ///[readOnly] can not edit text field
  final bool? readOnly;

  ///[FloatingLabelBehavior] defines the behavior of Floating label
  final FloatingLabelBehavior floatingLabelBehavior;

  final bool showColorPrefixBorder;

  ///[alignLabelWithHint] defines that the hint
  ///should be aligned with label or not.
  final bool alignLabelWithHint;

  //[title] defines the title above the edit field
  final String? title;

  ///[titleStyle] Style of title label
  final TextStyle? titleStyle;

  final double? suffixIconRotation;

  final TextCapitalization textCapitalization;

  final AutovalidateMode autoValidateMode;

  final TextDirection? textDirection;

  const CustomTextFormFieldWidget({
    super.key,
    required this.controller,
    this.formFieldKey,
    this.focusNode,
    this.maxLength,
    this.label = "",
    this.errorStyle,
    this.validator,
    this.hintStyle,
    this.titleStyle,
    this.title,
    this.prefixIconColor = Colors.transparent,
    this.autoFocus = false,
    this.onChange,
    this.textInputType = TextInputType.text,
    this.prefix,
    this.readOnly = false,
    this.cursorColor,
    this.input,
    this.isEditable,
    this.onTap,
    this.prefixIcon,
    this.obscureText = false,
    this.hint,
    this.suffix,
    this.style,
    this.suffixIcon,
    this.floatingStyle,
    this.borderColor,
    this.inputFormatters,
    this.maxLines = 1,
    this.onTextSubmit,
    this.prefixOnClick,
    this.suffixIconRotation,
    this.textDirection,
    this.prefixIconConstraints,
    this.suffixIconConstraints = const BoxConstraints(
        minWidth: Dimens.space25,
        minHeight: Dimens.space25,
        maxWidth: Dimens.space50,
        maxHeight: Dimens.space50),
    this.prefixIconSize = const Size(Dimens.iconSize16, Dimens.iconSize16),
    this.suffixIconSize,
    this.suffixOnClick,
    FloatingLabelBehavior? floatingLabelBehavior,
    bool? alignLabelWithHint,
    this.prefixText,
    this.textAlign,
    this.suffixText,
    this.textCapitalization = TextCapitalization.none,
    this.showColorPrefixBorder = false,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
  })  : floatingLabelBehavior =
            floatingLabelBehavior ?? FloatingLabelBehavior.never,
        alignLabelWithHint = alignLabelWithHint ?? true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Visibility(
          visible: title.isNotNullOrEmpty,
          child: Container(
            margin: const EdgeInsets.only(
                top: Dimens.padding8, bottom: Dimens.padding4),
            child: CustomTextLabelWidget(
                label: title ?? "",
                style: titleStyle ??
                    context.textTheme.titleLarge?.copyWith(
                      color: AppColors.mainTextBlackColor,
                      fontSize: Dimens.fontSize16,
                      fontWeight: FontWeight.w500,
                    )),
          ),
        ),
        TextFormField(
          key: formFieldKey,
          autovalidateMode: autoValidateMode,
          enableInteractiveSelection: true,
          maxLength: maxLength,
          controller: controller,
          validator: validator,
          onTap: onTap,
          textCapitalization: textCapitalization,
          keyboardType: textInputType,
          textInputAction: input,
          onChanged: onChange,
          readOnly: readOnly ?? false,
          focusNode: focusNode,
          autofocus: autoFocus ?? false,
          inputFormatters: inputFormatters,
          style: style ??
              context.textTheme.titleMedium?.copyWith(
                  color: AppColors.mainTextBlackColor,
                  fontSize: Dimens.fontSize16),
          maxLines: maxLines,
          enabled: isEditable,
          cursorColor: AppColors.primary,
          obscureText: obscureText ?? false,
          textAlign: textAlign ?? TextAlign.start,
          textDirection: textDirection,
          decoration: InputDecoration(
            counterText: '',
            hintTextDirection: textDirection,
            alignLabelWithHint: alignLabelWithHint,
            floatingLabelBehavior: floatingLabelBehavior,
            floatingLabelStyle: floatingStyle,
            suffixIconConstraints: suffixIconConstraints,
            prefixIconConstraints: prefixIconConstraints ??
                BoxConstraints(
                  minWidth: Dimens.space25,
                  minHeight: Dimens.space25,
                  maxWidth: prefixText.isNullOrEmpty
                      ? Dimens.space50
                      : Dimens.space90,
                  maxHeight: Dimens.space50,
                ),
            prefix: prefix,
            errorMaxLines: Dimens.errorMaxLine,
            errorStyle: (errorStyle ?? AppStyles.errorStyle).copyWith(
              height: 1,
            ),
            labelText: label,
            isDense: false,
            hintStyle: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: Dimens.fontSize16,
                color: AppColors.hintTextColor),
            hintText: hint,
            labelStyle: context.textTheme.titleMedium?.copyWith(
                fontSize: Dimens.fontSize14,
                fontWeight: FontWeight.w500,
                color: AppColors.hintTextColor),
            prefixIcon: prefixIcon != null
                ? GestureDetector(
                    onTap: () {
                      prefixOnClick?.call();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: Dimens.padding15,
                        right: Dimens.padding15,
                      ),
                      child: Row(
                        children: [
                          Container(
                            decoration: showColorPrefixBorder
                                ? BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: Dimens.borderWidth1,
                                      color: AppColors.lightGrayBGColor,
                                    ),
                                  )
                                : null,
                            child: prefixIcon?.svg(
                              height: prefixIconSize?.height,
                              width: prefixIconSize?.width,
                              colorFilter: showColorPrefixBorder
                                  ? ColorFilter.mode(
                                      prefixIconColor ?? AppColors.transparent,
                                      BlendMode.srcATop,
                                    )
                                  : null,
                            ),
                          ),
                          if (prefixText != null) ...[
                            const SizedBox(
                              width: Dimens.padding12,
                            ),
                          ],
                          Text(
                            prefixText ?? "",
                            style: context.textTheme.titleSmall?.copyWith(
                                fontSize: Dimens.fontSize16,
                                color: AppColors.mainTextBlackColor),
                          ),
                          if (prefixText != null) ...[
                            const SizedBox(
                              width: Dimens.padding6,
                            ),
                          ],
                        ],
                      ),
                    ),
                  )
                : null,
            suffix: suffix,
            suffixIcon: suffixIcon != null
                ? GestureDetector(
              onTap: () {
                suffixOnClick?.call();
              },
              child: Padding(
                padding: const EdgeInsets.only(right: Dimens.padding14),
                child: suffixIcon!.svg(
                  height: suffixIconSize?.height ?? Dimens.iconSize16,
                  width: suffixIconSize?.width ?? Dimens.iconSize16,
                  colorFilter: const ColorFilter.mode(
                    AppColors.mainTextBlackColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            )
                : null,

            contentPadding: const EdgeInsets.symmetric(
                horizontal: Dimens.padding14, vertical: Dimens.padding14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimens.radius6),
              borderSide: BorderSide(
                  color: borderColor ?? AppColors.blackColor,
                  width: Dimens.borderWidth1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimens.radius6),
              borderSide: BorderSide(
                  color: borderColor ?? AppColors.lightGrayBGColor,
                  width: Dimens.borderWidth1),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimens.radius6),
              borderSide: BorderSide(
                color: borderColor ?? AppColors.lightGrayBGColor,
                width: Dimens.borderWidth1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimens.radius6),
              borderSide: const BorderSide(
                  color: AppColors.mainTextBlackColor,
                  width: Dimens.borderWidth1),
            ),
          ),
        ),
      ],
    );
  }
}
