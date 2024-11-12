import 'exports.dart';

///define toolbar options
///
///[isToolBarVisible] will help to show/hide toolbar
///[isLogoVisible] will help to show/hide logo
///[isBackVisible] will help to show/hide back icon
///[appBarColor] will help to set color on appbar
///[leadingTitle] will help to show leading text
///[title] will help to show Center Title
///[titleLogo] will help to display center logo
///[currentController] will provide current controller
///[onBackOrCancel] will provide call back of back or cancel button click

class ToolBarModel {
  bool isToolBarVisible, isLogoVisible, isMenuVisible, isSafeAreaVisible;
  Color? appBarColor;

  Function()? onMenuClick;
  Function()? onLogoutClick;

  ToolBarModel(
      {this.isToolBarVisible = false,
      this.isSafeAreaVisible = true,
      this.isMenuVisible = false,
      this.appBarColor = AppColors.blueBGColor,
      this.isLogoVisible = false,
      // this.currentController,
      this.onLogoutClick});
}
