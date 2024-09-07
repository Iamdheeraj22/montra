part of 'login_bloc.dart';

final class LoginState extends Equatable {
  final bool isPasswordVisible;
  final LoginStatus status;

  const LoginState({
    this.isPasswordVisible = false,
    this.status = LoginStatus.initial,
  });

  LoginState copyWith({
    bool? isPasswordVisible,
    LoginStatus? status,
  }) {
    return LoginState(
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        isPasswordVisible,
        status,
      ];
}

enum LoginStatus {
  initial,
  loading,
  success,
  failure,
}
