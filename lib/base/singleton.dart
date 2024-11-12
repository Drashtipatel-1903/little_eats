import '../../../utils/exports.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<AppRouter>(AppRouter());
  getIt.registerSingleton<LocaleCubit>(LocaleCubit());
  getIt.registerSingleton<MainConfig>(MainConfig());
  getIt.registerSingleton<ApiClient>(ApiClient());
  getIt.registerSingleton<ForceUpdateUnderMaintenanceCubit>(
      ForceUpdateUnderMaintenanceCubit());
}
