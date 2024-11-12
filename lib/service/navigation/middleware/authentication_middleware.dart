import '../../../utils/exports.dart';

class AuthenticationMiddleWare extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    var isLogin = SharedPref.getBool(PrefsKey.isLoggedInKey, false);
    if (isLogin) {
      router.pushNamed(AppPaths.dashboard);
    } else {
      resolver.next(true);
    }
  }
}
