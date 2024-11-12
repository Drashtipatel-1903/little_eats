import '../../../utils/exports.dart';

class ForceUpdateUnderMaintenanceState extends Equatable {
  final ForceUpdateConfigModel? forceUpdateConfigModel;
  final UnderMaintenanceType? underMaintenanceType;
  final UpdateMaintenanceType? updateMaintenanceType;
  final bool? isAlertDialogVisible;
  final BaseStateStatus status;

  const ForceUpdateUnderMaintenanceState({
    required this.status,
    this.underMaintenanceType,
    this.updateMaintenanceType,
    this.forceUpdateConfigModel,
    this.isAlertDialogVisible,
  });

  ForceUpdateUnderMaintenanceState copyWith(
      {ForceUpdateConfigModel? forceUpdateConfigModel,
      UnderMaintenanceType? underMaintenanceType,
      UpdateMaintenanceType? updateMaintenanceType,
      bool? isAlertDialogVisible,
      required BaseStateStatus status}) {
    return ForceUpdateUnderMaintenanceState(
      forceUpdateConfigModel:
          forceUpdateConfigModel ?? this.forceUpdateConfigModel,
      isAlertDialogVisible: isAlertDialogVisible ?? this.isAlertDialogVisible,
      underMaintenanceType: underMaintenanceType ?? this.underMaintenanceType,
      updateMaintenanceType:
          updateMaintenanceType ?? this.updateMaintenanceType,
      status: status,
    );
  }

  @override
  List<Object?> get props => [
        status,
        forceUpdateConfigModel,
        underMaintenanceType,
        updateMaintenanceType,
        isAlertDialogVisible
      ];
}
