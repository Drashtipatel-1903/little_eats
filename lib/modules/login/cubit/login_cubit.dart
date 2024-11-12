import 'package:firebase_auth/firebase_auth.dart';

import '../../../utils/exports.dart';

class LoginCubit extends Cubit<LoginState> {
  final formKey = GlobalKey<FormState>();

  LoginCubit({
    required LoginState initialState,
  }) : super(initialState);

  ///handle redirection
  /// TODO : For Future Use
  _handleRedirection(BuildContext ctx) {
    if (SharedPref.getBool(PrefsKey.isLoggedInKey) == false) {
      SharedPref.setValue(PrefsKey.isLoggedInKey, true);

      SentryService.instance.captureEvent("Login Successfully",
          tagKey: "navigation", tagValue: "login");
      ctx.router.pushNamed(AppPaths.signup);
    }
  }

  ///handle email change
  bool isEmailValid(String email) {
    return email.trim().validateEmail(MainConfig.context) == null;
  }

  /// Check if the password is valid
  bool isPasswordValid(String password) {
    return password.trim().validatePassword(MainConfig.context) == null;
  }

  /// Check form validity and update button state
  void checkFormValidity() {
    final email = state.emailController.text;
    final password = state.passwordController.text;

    final isValid = isEmailValid(email) && isPasswordValid(password);

    emit(state.copyWith(
      isBtnDisable: !isValid,
    ));
  }

  /// Handle email change
  emailChange(String email) {
    final updatedLoginLocal = state.loginLocal.copyWith(email: email);
    emit(state.copyWith(
      loginLocal: updatedLoginLocal,
    ));
    checkFormValidity();
  }

  /// Handle password change
  passwordChange(String password) {
    final updatedLoginLocal = state.loginLocal.copyWith(password: password);
    emit(state.copyWith(
      loginLocal: updatedLoginLocal,
    ));
    checkFormValidity();
  }

  void toggleCurrentPassObscureText() {
    emit(
      state.copyWith(
        currentPasswordObscureText: !state.currentPasswordObscureText,
      ),
    );
  }

  // Login Method
  Future<void> login(String email, String password) async {
    emit(state.copyWith(status: BaseStateStatus.loading));
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(state.copyWith(
        status: BaseStateStatus.success,
      ));
      DebugLog.i("UUID : ${userCredential.user!.uid}");
    } catch (e) {
      emit(state.copyWith(
        status: BaseStateStatus.failure,
      ));
      DebugLog.e("Login Error: $e");
    }
  }



  ///handle login validation
  Future<void> loginValidation(BuildContext context) async {
    if (formKey.currentState?.validate() ?? false) {
      final email = state.emailController.text.trim();
      final password = state.passwordController.text.trim();

      DebugLog.i("Email : $email");
      DebugLog.i("pass : $password");
      await login(email, password);

    }
  }
}
