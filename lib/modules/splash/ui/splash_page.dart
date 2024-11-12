import '../../../utils/exports.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => SplashCubit()..init(),
      child: const SplashWidget(),
    );
  }
}
