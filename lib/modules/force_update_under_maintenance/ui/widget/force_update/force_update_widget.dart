import '../../../../../utils/exports.dart';

class ForceUpdateWidget extends BaseResponsiveView {
  const ForceUpdateWidget({super.key});

  @override
  buildDesktopWidget(BuildContext context) {
    return _buildView(context);
  }

  @override
  buildMobileWidget(BuildContext context) {
    return _buildView(context);
  }

  @override
  buildTabletWidget(BuildContext context) {
    return _buildView(context);
  }

  _buildView(BuildContext context) {
    return BlocConsumer<ForceUpdateUnderMaintenanceCubit,
        ForceUpdateUnderMaintenanceState>(
      builder: (BuildContext context, state) {
        return Visibility(
          replacement: Container(color: AppColors.transparent),
          visible: state.underMaintenanceType != UnderMaintenanceType.none,
          child: Center(
            child: state.underMaintenanceType == UnderMaintenanceType.image
                ? UnderMaintenanceImageWidget(
                    config: state.forceUpdateConfigModel)
                : UnderMaintenanceTextWidget(
                    config: state.forceUpdateConfigModel),
          ),
        );
      },
      listener: (BuildContext context, ForceUpdateUnderMaintenanceState state) {
        if (state.updateMaintenanceType != UpdateMaintenanceType.none &&
            state.updateMaintenanceType != UpdateMaintenanceType.maintenance) {
          _showUpdateDialog(state.forceUpdateConfigModel,
              isMandatory:
                  state.updateMaintenanceType == UpdateMaintenanceType.force,
              context: context);
        }
      },
      buildWhen: (previous, current) =>
          (current.status == BaseStateStatus.success) &&
          (current.underMaintenanceType != previous.underMaintenanceType),
      listenWhen: (previous, current) =>
          (current.status == BaseStateStatus.success) &&
          (current.updateMaintenanceType != previous.updateMaintenanceType),
    );
  }

  /// The _showUpdateDialog function displays a dialog with update information and
  /// options for the user to update or cancel based on the provided configuration
  /// and context.
  _showUpdateDialog(ForceUpdateConfigModel? configModel,
      {required bool isMandatory, required BuildContext context}) {
    showDialog(
      context: MainConfig.context,
      barrierDismissible: false,
      useRootNavigator: false,
      builder: (BuildContext ctx) {
        return PopScope(
          canPop: false,
          child: DialogUtils(
            isDialogHideOnClick: false,
            message: configModel?.forceUpdate?.forceUpdateMsg ?? '',
            title: ctx.appString.updateAppKey,
            okBtnTitle: ctx.appString.updateKey,
            cancelBtnTitle: isMandatory ? null : ctx.appString.cancelKey,
            onOkClicked: () {
              context
                  .instance<ForceUpdateUnderMaintenanceCubit>()
                  .openPlayStoreAppStore(context);
            },
            onCancelClicked: isMandatory
                ? null
                : () {
                    context
                        .instance<ForceUpdateUnderMaintenanceCubit>()
                        .redirectToLogin(context);
                  },
          ),
        );
      },
    );
  }
}
