import '../../../../../../utils/exports.dart';

class SignupLocal extends Equatable {
  final String? fullName;
  final String? email;
  final String? password;
  final String? confirmPassword;
  final bool? isPasswordVisible;
  final bool? isRemember;

  const SignupLocal({
    this.fullName,
    this.email,
    this.confirmPassword,
    this.password,
    this.isPasswordVisible,
    this.isRemember,
  });

  // Equatable props for comparison
  @override
  List<Object?> get props => [
    email,
    fullName,
    confirmPassword,
    password,
    isPasswordVisible,
    isRemember,
  ];

  // Factory constructor for creating a new LoginLocal instance from a map
  factory SignupLocal.fromJson(Map<String, dynamic> json) {
    return SignupLocal(
      email: json['email'] as String?,
      fullName: json['fullName'] as String?,
      confirmPassword: json['confirmPassword'] as String?,
      password: json['password'] as String?,
      isPasswordVisible: json['isPasswordVisible'] as bool?,
      isRemember: json['isRemember'] as bool?,
    );
  }

  // Method for converting a LoginLocal instance to a map
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'confirmPassword': confirmPassword,
      'fullName': fullName,
      'password': password,
      'isPasswordVisible': isPasswordVisible,
      'isRemember': isRemember,
    };
  }

  // Manually added copyWith method
  SignupLocal copyWith({
    String? email,
    String? fullName,
    String? confirmPassword,
    String? password,
    bool? isPasswordVisible,
    bool? isRemember,
  }) {
    return SignupLocal(
      confirmPassword: confirmPassword ?? this.confirmPassword,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      password: password ?? this.password,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isRemember: isRemember ?? this.isRemember,
    );
  }
}
