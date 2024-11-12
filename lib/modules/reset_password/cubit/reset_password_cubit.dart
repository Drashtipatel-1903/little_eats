import '../../../utils/exports.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit({
    required ResetPasswordState initialState,
  }) : super(initialState);

  /// Handle password change
  passwordChange(String password) {
    final updatedPasswordLocal =
        state.resetPasswordLocal.copyWith(password: password);
    emit(state.copyWith(
      resetPasswordLocal: updatedPasswordLocal,
    ));
    //checkFormValidity();
  }

  confirmPasswordChange(String confirmPassword) {
    final updatedPasswordLocal =
        state.resetPasswordLocal.copyWith(confirmPassword: confirmPassword);
    emit(state.copyWith(
      resetPasswordLocal: updatedPasswordLocal,
    ));
    //checkFormValidity();
  }

  void toggleCurrentPassObscureText() {
    emit(
      state.copyWith(
        passwordObscureText: !state.passwordObscureText,
      ),
    );
  }

  void toggleConfirmPassObscureText() {
    emit(
      state.copyWith(
        confirmPasswordObscureText: !state.confirmPasswordObscureText,
      ),
    );
  }
}
