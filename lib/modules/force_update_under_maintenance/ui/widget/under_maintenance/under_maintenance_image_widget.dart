import '../../../../../utils/exports.dart';

/// The class  displays an image based on the
/// `maintenanceImage` property from a `ForceUpdateConfigModel` object, with a
/// placeholder image and specified height.

class UnderMaintenanceImageWidget extends StatelessWidget {
  final ForceUpdateConfigModel? config;

 const UnderMaintenanceImageWidget({super.key, this.config});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.padding8),
      child: CustomNetworkImageWidget(
        imageUrl: config?.underMaintenance?.maintainanceImage ?? '',
        placeHolderImage: Assets.svgs.icAppbarLogo,
        fit: BoxFit.contain,
      ),
    );
  }
}
