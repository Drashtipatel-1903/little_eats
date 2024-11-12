import '../../../utils/exports.dart';

abstract class AppStyles {
  //-----------------------------Light------------------------

  //light with font size 96
  static final TextStyle _displayLarge = _textStyle.copyWith(
      fontSize: Dimens.fontSize96, fontWeight: FontWeight.w300);

  //extra-light with font size 60
  static final TextStyle _displayMedium = _textStyle.copyWith(
      fontSize: Dimens.fontSize60, fontWeight: FontWeight.w200);

  //thin with font size 48
  static final TextStyle _displaySmall = _textStyle.copyWith(
      fontSize: Dimens.fontSize48, fontWeight: FontWeight.w100);

  //------------------------------Semi-Bold--------------------

  //semi-bold with font size 18
  static final TextStyle _headlineMedium = _textStyle.copyWith(
      fontSize: Dimens.fontSize18, fontWeight: FontWeight.w600);

  //semi-bold with font size 16
  static final TextStyle _headlineSmall = _textStyle.copyWith(
      fontSize: Dimens.fontSize16, fontWeight: FontWeight.w600);

  //-----------------------Title------------------------------

  //bold with font size 18
  static final TextStyle _titleSmall = _textStyle.copyWith(
      fontSize: Dimens.fontSize18, fontWeight: FontWeight.w700);

  //semi-bold with font size 20
  static final TextStyle _titleMedium = _textStyle.copyWith(
      fontSize: Dimens.fontSize20, fontWeight: FontWeight.w600);

  //bold with font size 24
  static final TextStyle _titleLarge = _textStyle.copyWith(
    fontSize: Dimens.fontSize24,
    fontWeight: FontWeight.w700,
  );

  //---------------------------body--------------------------
  //regular with font size 16 with light color
  static final TextStyle _bodySmall = _textStyle.copyWith(
      fontSize: Dimens.fontSize16, color: AppColors.lightGrayTextColor);

  //medium with font size 16
  static final TextStyle _bodyMedium = _textStyle.copyWith(
      fontSize: Dimens.fontSize16, fontWeight: FontWeight.w500);

  //regular with font size 16
  static final TextStyle _bodyLarge = _textStyle.copyWith(
    fontSize: Dimens.fontSize16,
  );

  //---------------------------Medium--------------------------
  //regular with font size 16 with black color
  static final TextStyle _labelLarge = _textStyle.copyWith(
      fontSize: Dimens.fontSize16, color: AppColors.blackTextColor);

  //medium with font size 16 with black color
  static final TextStyle _labelMedium = _textStyle.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: Dimens.fontSize16,
      color: AppColors.blackTextColor);

  //regular with font size 14 with medium gray color
  static final TextStyle _labelSmall = _textStyle.copyWith(
      fontSize: Dimens.fontSize14, color: AppColors.mediumGrayTextColor);

  //regular with font size 14 with black color

  static final TextStyle _textStyle = const TextStyle(
      color: AppColors.mainTextBlackColor,
      fontFamily: 'DMSans',
      fontSize: Dimens.fontSize16);

  static TextStyle get errorStyle => _bodyMedium.copyWith(
        color: AppColors.redTextColor,
      );

  static TextStyle get hintStyle => _textStyle.copyWith(
        color: AppColors.lightGreyColor,
      );

  static TextTheme get textTheme => TextTheme(
        bodyLarge: _bodyLarge,
        bodyMedium: _bodyMedium,
        bodySmall: _bodySmall,
        displayLarge: _displayLarge,
        displayMedium: _displayMedium,
        displaySmall: _displaySmall,
        headlineMedium: _headlineMedium,
        headlineSmall: _headlineSmall,
        titleLarge: _titleLarge,
        titleMedium: _titleMedium,
        titleSmall: _titleSmall,
        labelLarge: _labelLarge,
        labelMedium: _labelMedium,
        labelSmall: _labelSmall,
      );
}
