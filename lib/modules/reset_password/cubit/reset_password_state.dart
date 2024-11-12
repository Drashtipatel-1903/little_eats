import 'package:little_eats/modules/reset_password/model/local/reset_password_local.dart';

import '../../../utils/exports.dart';

class ResetPasswordState extends Equatable {
  final BaseStateStatus status;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final bool passwordObscureText;
  final bool confirmPasswordObscureText;
  final bool isBtnDisable;
  final ResetPasswordLocal resetPasswordLocal;

  const ResetPasswordState({
    this.status = BaseStateStatus.initial,
    required this.passwordController,
    required this.confirmPasswordController,
    this.passwordObscureText = true,
    this.confirmPasswordObscureText = true,
    this.isBtnDisable = true,
    this.resetPasswordLocal = const ResetPasswordLocal(),
  });

  ResetPasswordState copyWith({
    BaseStateStatus? status,
    ResetPasswordLocal? resetPasswordLocal,
    bool? isNextButtonDisable,
    bool? isSelected,
    bool? isExpanded,
    bool? isBtnDisable,
    TextEditingController? confirmPasswordController,
    TextEditingController? passwordController,
    bool? passwordObscureText,
    bool? confirmPasswordObscureText,
  }) {
    return ResetPasswordState(
      status: status ?? this.status,
      resetPasswordLocal: resetPasswordLocal ?? this.resetPasswordLocal,
      isBtnDisable: isBtnDisable ?? this.isBtnDisable,
      passwordController: passwordController ?? this.passwordController,
      confirmPasswordController:
          confirmPasswordController ?? this.confirmPasswordController,
      passwordObscureText: passwordObscureText ?? this.passwordObscureText,
      confirmPasswordObscureText:
          confirmPasswordObscureText ?? this.confirmPasswordObscureText,
    );
  }

  @override
  List<dynamic> get props => [
        status,
        confirmPasswordController,
        passwordController,
        passwordObscureText,
        isBtnDisable,
        confirmPasswordObscureText,
        resetPasswordLocal,
      ];
}
