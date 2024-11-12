import '../../../../utils/exports.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (ctx) => LoginCubit(
              initialState: LoginState(
                emailController: TextEditingController(),
                passwordController: TextEditingController(),
              ),
            ),
        child: const LoginForm());
  }
}
