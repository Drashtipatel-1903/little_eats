import 'package:async/async.dart';

import 'exports.dart';

///this file helps to define all the common function

/// hide Keyboard
void hideKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

//----------------------------------------------------------------------

/// hide status bar
void showStatusBar() async {
  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom],
  );
}
//----------------------------------------------------------------------

/// show status bar
void hideStatusBar() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
}
//----------------------------------------------------------------------

///go back
///
/// helps to go back to previous page
void goBack(BuildContext context, {dynamic result}) {
  context.router.maybePop(result);
}

//-------------------------------------------------------------------------------

///loader view
///
/// [value] while value comes true then loader will be visible else hide
void showLoader({required bool value, String? message}) {
  if (value) {
    // show loader here
    EasyLoading.show(status: message);
  } else {
    EasyLoading.dismiss(animation: true);
    // hide loader here
  }
}

///perform async tasks using "FutureGroup"
performAsyncTask(List<dynamic> functionsList,
    {Function(List<dynamic>)? success}) async {
  FutureGroup futureGroup = FutureGroup();
  for (var function in functionsList) {
    futureGroup.add(function);
  }
  futureGroup.close();
  await futureGroup.future.then((value) {
    success?.call(value);
  });
}

isSmallDevice() {
  return !(MainConfig.context.height >= AppConstant.smallDeviceHeight);
}

///function add item in pager list
List<Widget> addOnBoardingPagerList() {
  return [
    OnBoardingPagerItemViewWidget(
      title: MainConfig.context.appString.customMealPlanKey,
      description: MainConfig.context.appString.onBoardingDescOne,
      assetImage: Assets.png.icOnboardin1,
    ),
    OnBoardingPagerItemViewWidget(
      title: MainConfig.context.appString.parentPreferenceKey,
      description: MainConfig.context.appString.onBoardingDescTwo,
      assetImage: Assets.png.icOnboardin2,
    ),
    OnBoardingPagerItemViewWidget(
      title: MainConfig.context.appString.groceryListSyncKey,
      description: MainConfig.context.appString.onBoardingDescThree,
      assetImage: Assets.png.icOnboardin3,
    ),
  ];
}

///launch url in web browser
Future<void> launchUrlInBrowser(String url) async {
  try {
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication,
        webViewConfiguration:
        const WebViewConfiguration(enableJavaScript: true))) {
    }
  } on Exception catch (e) {
    debugPrint(e.toString());
  }
}