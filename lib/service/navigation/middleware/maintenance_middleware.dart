import '../../../utils/exports.dart';

class MaintenanceMiddleware extends AutoRouteGuard {
  @override
  Future<void> onNavigation(
      NavigationResolver resolver, StackRouter router) async {
    var forceUpdate = ForceUpdateUnderMaintenanceCubit.instance();
    var type = forceUpdate.getUpdateOrMaintenanceType(await forceUpdate.readRemoteConfig());
    if (type == UpdateMaintenanceType.none) {
      resolver.next(true);
    } else {
      router.pushNamed(AppPaths.maintenance);
    }
  }
}
