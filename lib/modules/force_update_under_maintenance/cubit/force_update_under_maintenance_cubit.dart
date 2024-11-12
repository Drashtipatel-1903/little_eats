import '../../../utils/exports.dart';

class ForceUpdateUnderMaintenanceCubit
    extends Cubit<ForceUpdateUnderMaintenanceState> {
  static ForceUpdateUnderMaintenanceCubit instance() =>
      getIt<ForceUpdateUnderMaintenanceCubit>();

  ForceUpdateUnderMaintenanceCubit()
      : super(const ForceUpdateUnderMaintenanceState(
            status: BaseStateStatus.initial,
            forceUpdateConfigModel: null,
            underMaintenanceType: UnderMaintenanceType.none,
            updateMaintenanceType: UpdateMaintenanceType.none));

  ///get remote config details
   Future<ForceUpdateConfigModel?> readRemoteConfig() async {
    FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
    try {
      await remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: Dimens.duration10),
        minimumFetchInterval: const Duration(seconds: Dimens.duration10),
      ));
      await remoteConfig.fetchAndActivate();
      if (remoteConfig.getString(AppConstant.updateApp).isNotEmpty) {
        return ForceUpdateConfigModel.fromJson(
            jsonDecode(remoteConfig.getString(AppConstant.updateApp)));
      }
    } catch (e) {
      debugPrint("Error fetching remote config: $e");
    }
    remoteConfig.onConfigUpdated.listen((event) {
      checkAppUpdate();
    });
    return null;
  }

  ///check update or maintenance
  Future<void> checkAppUpdate() async {
    showLoader(value: true);
    ForceUpdateConfigModel? config = await readRemoteConfig();
    var type = getUpdateOrMaintenanceType(config);

    showLoader(value: false);
    switch (type) {
      case UpdateMaintenanceType.none:
        {
          redirectToLogin(MainConfig.context);
        }
      case UpdateMaintenanceType.force:
        {
          emit(state.copyWith(
              updateMaintenanceType: UpdateMaintenanceType.force,
              underMaintenanceType: UnderMaintenanceType.none,
              forceUpdateConfigModel: config,
              status: BaseStateStatus.success));
        }
      case UpdateMaintenanceType.optional:
        {
          emit(state.copyWith(
              updateMaintenanceType: UpdateMaintenanceType.optional,
              underMaintenanceType: UnderMaintenanceType.none,
              forceUpdateConfigModel: config,
              status: BaseStateStatus.success));
        }
      case UpdateMaintenanceType.maintenance:
        emit(state.copyWith(
            forceUpdateConfigModel: config,
            updateMaintenanceType: UpdateMaintenanceType.maintenance,
            underMaintenanceType: _underMaintenanceType(config),
            status: BaseStateStatus.success));
    }
  }

   UpdateMaintenanceType getUpdateOrMaintenanceType(
      ForceUpdateConfigModel? config) {
    //get details of android version
    String? androidMinVersion = config?.forceUpdate?.androidMinVersion;
    String? androidMaxVersion = config?.forceUpdate?.androidMaxVersion;

    //get details of iOS version
    String? iosMaxVersion = config?.forceUpdate?.iosMaxVersion;
    String? iosMinVersion = config?.forceUpdate?.iosMinVersion;

    //get details current version
    String currentAppVersion = getIt<MainConfig>().packageInfo.version;

    if (config?.underMaintenance?.isMaintainanceModeEnable ?? false) {
      return UpdateMaintenanceType.maintenance;
    }
    if (!kIsWeb) {
      if (Platform.isAndroid) {
        if (androidMinVersion != null) {
          //check if current app version is less than min version
          //then do force update
          if (currentAppVersion.compareTo(androidMinVersion) < 0) {
            return UpdateMaintenanceType.force;
          } else if (androidMaxVersion != null &&
              currentAppVersion.compareTo(androidMinVersion) >= 0 &&
              currentAppVersion.compareTo(androidMaxVersion) < 0) {
            return UpdateMaintenanceType.optional;
          }
        }
        return UpdateMaintenanceType.none;
      } else if (Platform.isIOS) {
        if (iosMinVersion != null) {
          if (currentAppVersion.compareTo(iosMinVersion) < 0) {
            return UpdateMaintenanceType.force;
          } else if (iosMaxVersion != null &&
              currentAppVersion.compareTo(iosMinVersion) >= 0 &&
              currentAppVersion.compareTo(iosMaxVersion) < 0) {
            return UpdateMaintenanceType.optional;
          }
        }
        return UpdateMaintenanceType.none;
      }
    }
    return UpdateMaintenanceType.none;
  }

  ///check if under maintenance image
  static UnderMaintenanceType _underMaintenanceType(
      ForceUpdateConfigModel? config) {
    if ((config?.underMaintenance?.maintainancePriority ?? 0) ==
        UnderMaintenanceType.image.type) {
      return UnderMaintenanceType.image;
    } else {
      return UnderMaintenanceType.text;
    }
  }

  /// open play store or app store
  void openPlayStoreAppStore(BuildContext context) async {
    Uri parseUrl;
    try {
      if (Platform.isAndroid) {
        parseUrl = Uri.parse(
            '${AppConstant.playStoreURL}${getIt<MainConfig>().packageInfo.packageName}');
      } else if (Platform.isIOS) {
        parseUrl = Uri.parse('${AppConstant.appstoreURL}${AppConstant.appId}');
      } else {
        throw PlatformException(
            code: 'PlatformNotSupported',
            message: 'This platform is not supported');
      }

      if (await canLaunchUrl(parseUrl)) {
        await launchUrl(parseUrl);
        // ignore: use_build_context_synchronously
        goBack(context);
      } else {
        throw 'Could not launch ${parseUrl.toString()}';
      }
    } catch (e) {
      debugPrint("Error launching store: $e");
    }
  }

  /// redirect to login
  void redirectToLogin(BuildContext ctx) {
    goBack(ctx);
    ctx.router.pushAndPopUntil(const LoginRoute(), predicate: (route) => false);
  }
}
