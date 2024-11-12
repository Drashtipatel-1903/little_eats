import '../../../utils/exports.dart';

class LoginState extends Equatable {
  final BaseStateStatus status;
  final LoginLocal loginLocal;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool currentPasswordObscureText;
  final bool isBtnDisable;

  const LoginState({
    this.status = BaseStateStatus.initial,
    this.loginLocal = const LoginLocal(),
    required this.emailController,
    required this.passwordController,
    this.currentPasswordObscureText = true,
    this.isBtnDisable = true,
  });

  LoginState copyWith({
    BaseStateStatus? status,
    LoginLocal? loginLocal,
    bool? onChange,
    bool? isBtnDisable,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    bool? currentPasswordObscureText,
  }) {
    return LoginState(
      status: status ?? this.status,
      loginLocal: loginLocal ?? this.loginLocal,
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      currentPasswordObscureText:
          currentPasswordObscureText ?? this.currentPasswordObscureText,
      isBtnDisable: isBtnDisable ?? this.isBtnDisable,
    );
  }

  @override
  List<dynamic> get props => [
        status,
        loginLocal,
        emailController,
        passwordController,
        currentPasswordObscureText,
        isBtnDisable,
      ];
}
