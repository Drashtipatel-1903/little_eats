import '../../../../utils/exports.dart';

@RoutePage()
class ForceUpdateUnderMaintenancePage extends StatelessWidget {
  const ForceUpdateUnderMaintenancePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.instance<ForceUpdateUnderMaintenanceCubit>().checkAppUpdate();
    return const ForceUpdateWidget();
  }
}
