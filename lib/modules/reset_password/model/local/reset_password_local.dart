import '../../../../utils/exports.dart';

class ResetPasswordLocal extends Equatable {
  final String? confirmPassword;
  final String? password;
  final bool? isPasswordVisible;

  const ResetPasswordLocal({
    this.confirmPassword,
    this.password,
    this.isPasswordVisible,
  });

  // Equatable props for comparison
  @override
  List<Object?> get props => [
        confirmPassword,
        password,
        isPasswordVisible,
      ];

  factory ResetPasswordLocal.fromJson(Map<String, dynamic> json) {
    return ResetPasswordLocal(
      confirmPassword: json['confirmPassword'] as String?,
      password: json['password'] as String?,
      isPasswordVisible: json['isPasswordVisible'] as bool?,
    );
  }

  // Method for converting a LoginLocal instance to a map
  Map<String, dynamic> toJson() {
    return {
      'confirmPassword': confirmPassword,
      'password': password,
      'isPasswordVisible': isPasswordVisible,
    };
  }

  // Manually added copyWith method
  ResetPasswordLocal copyWith({
    String? confirmPassword,
    String? password,
    bool? isPasswordVisible,
  }) {
    return ResetPasswordLocal(
      confirmPassword: confirmPassword ?? this.confirmPassword,
      password: password ?? this.password,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }
}
