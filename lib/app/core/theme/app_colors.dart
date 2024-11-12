import '../../../utils/exports.dart';

abstract class AppColors {
  static const transparent = Colors.transparent;
  static const whiteColor = Colors.white;
  static const blackColor = Color(0xFF2F2F2F);

  static const normalGreyColor = Color(0xFF878893);
  static const lightGreyColor = Color(0xFFEEEEEE);
  static const blueColor = Color(0xFF1C6586);
  static const lightBlueColor = Color(0xFFE2F1F8);
  static const normalRedColor = Color(0xFFEA4128);
  static const lightRedColor = Color(0xFFE74646);
  static final errorContainer = Colors.redAccent.shade100;
  static const mainTextColor = Color(0xFF262626);
  static const subTextColor = Color(0xFF767676);
  static const inActiveGrayColor = Color(0xFFAFAFAF);
  static const proBGColor = Color(0xFF861C5E);
  static const onBoardingBGColor = Color(0xFFEEF5F9);
  static const hintTextColor = Color(0xFF727272);
  static const disableTextColor = Color(0xFF9DA2B3);
  static const disableDotIndicatorColor = Color(0xFFBBBBBB);
  static const disableStepperColor = Color(0xFFCDCDCD);
  static const containerBorderColor = Color(0xFFDAD8DB);
  static const pinkColor = Color(0xFFEF3D53);
  static const colorBlack = Color(0xFF000000);
  static const colorGradient = Color(0xFFD9D9D9);
  static const colorF4F4F4 = Color(0xFFF4F4F4);

  static const primary = blueColor;
  static const onPrimary = whiteColor;
  static const primaryContainer = primary;
  static const onPrimaryContainer = onPrimary;

  static const secondary = blueColor;
  static const onSecondary = onPrimary;

  static const onSecondaryContainer = primary;
  static const secondaryContainer = onPrimary;

  static const background = whiteBGColor;
  static const onBackground = onPrimary;
  static const surface = whiteColor;
  static const onSurface = blackColor;

  /// Alerts colors (Used in Listing)
  static const redColor = normalRedColor;

  //Text colors
  static const whiteTextColor = whiteColor;
  static const blackTextColor = blackColor;
  static const mainTextBlackColor = mainTextColor;
  static const lightGrayTextColor = lightGreyColor;
  static const mediumGrayTextColor = normalGreyColor;
  static const redTextColor = lightRedColor;
  static const blueTextColor = blueColor;

  static const borderShadowColor = Color(0x00000029);



  //BackgroundColors
  static const whiteBGColor = whiteColor;
  static const blueBGColor = blueColor;
  static const lightBlueBGColor = lightBlueColor;
  static const mediumGrayBGColor = normalGreyColor;
  static const blackBGColor = blackColor;
  static const lightGrayBGColor = lightGreyColor;
  static const lightRedBGColor = lightRedColor;
  static const onboardingBGColor = onBoardingBGColor;
}
