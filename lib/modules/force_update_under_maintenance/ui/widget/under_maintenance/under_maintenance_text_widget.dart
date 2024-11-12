import '../../../../../utils/exports.dart';

/// The class  displays maintenance title and
/// description based on the provided `ForceUpdateConfigModel` configuration.

class UnderMaintenanceTextWidget extends StatelessWidget {
  final ForceUpdateConfigModel? config;

  const UnderMaintenanceTextWidget({super.key, this.config});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.padding8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextLabelWidget(
            label: config?.underMaintenance?.maintainanceTitle ?? '',
            style: MainConfig.textTheme.titleLarge,
          ),
          const SizedBox(height: Dimens.space20),
          CustomTextLabelWidget(
            label: config?.underMaintenance?.maintainanceDescription ?? '',
            style: MainConfig.textTheme.bodyMedium,
          )
        ],
      ),
    );
  }
}
