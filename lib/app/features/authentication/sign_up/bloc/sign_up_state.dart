part of 'sign_up_bloc.dart';

final class SignUpState extends Equatable {
  final bool isAgree;
  final bool isPasswordVisible;
  final SignUpStatus status;
  const SignUpState({
    this.isAgree = false,
    this.isPasswordVisible = false,
    this.status = SignUpStatus.initial,
  });

  SignUpState copyWith({
    bool? isAgree,
    bool? isPasswordVisible,
    SignUpStatus? status,
  }) {
    return SignUpState(
      isAgree: isAgree ?? this.isAgree,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        isAgree,
        isPasswordVisible,
        status,
      ];
}

enum SignUpStatus {
  initial,
  registering,
  emailVerificationSending,
  success,
  failure,
}
