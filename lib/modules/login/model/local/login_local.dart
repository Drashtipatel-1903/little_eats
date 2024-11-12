import '../../../../utils/exports.dart';

class LoginLocal extends Equatable {
  final String? email;
  final String? password;
  final bool? isPasswordVisible;
  final bool? isRemember;

  const LoginLocal({
    this.email,
    this.password,
    this.isPasswordVisible,
    this.isRemember,
  });

  // Equatable props for comparison
  @override
  List<Object?> get props => [
    email,
    password,
    isPasswordVisible,
    isRemember,
  ];

  // Factory constructor for creating a new LoginLocal instance from a map
  factory LoginLocal.fromJson(Map<String, dynamic> json) {
    return LoginLocal(
      email: json['email'] as String?,
      password: json['password'] as String?,
      isPasswordVisible: json['isPasswordVisible'] as bool?,
      isRemember: json['isRemember'] as bool?,
    );
  }

  // Method for converting a LoginLocal instance to a map
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'isPasswordVisible': isPasswordVisible,
      'isRemember': isRemember,
    };
  }

  // Manually added copyWith method
  LoginLocal copyWith({
    String? email,
    String? password,
    bool? isPasswordVisible,
    bool? isRemember,
  }) {
    return LoginLocal(
      email: email ?? this.email,
      password: password ?? this.password,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isRemember: isRemember ?? this.isRemember,
    );
  }
}
