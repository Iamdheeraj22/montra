part of 'sign_up_bloc.dart';

final class SignUpState extends Equatable {
  final bool isAgree;
  final bool isPasswordVisible;
  final SignUpStatus status;
  final SignUpStatus googleStatus;
  final String email;
  const SignUpState({
    this.isAgree = false,
    this.isPasswordVisible = false,
    this.status = SignUpStatus.initial,
    this.googleStatus = SignUpStatus.initial,
    this.email = '',
  });

  SignUpState copyWith({
    bool? isAgree,
    bool? isPasswordVisible,
    SignUpStatus? status,
    SignUpStatus? googleStatus,
    String? email,
  }) {
    return SignUpState(
      isAgree: isAgree ?? this.isAgree,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      status: status ?? this.status,
      googleStatus: googleStatus ?? this.googleStatus,
      email: email ?? this.email,
    );
  }

  @override
  List<Object> get props => [
        isAgree,
        isPasswordVisible,
        status,
        googleStatus,
        email,
      ];
}

enum SignUpStatus {
  initial,
  registering,
  emailVerificationSending,
  googleRegistration,
  success,
  failure,
}
