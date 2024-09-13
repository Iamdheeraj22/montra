part of 'email_verification_cubit.dart';

class EmailVerificationState extends Equatable {
  const EmailVerificationState({
    this.status = EmailVerificationStatus.initial,
  });
  final EmailVerificationStatus status;
  @override
  List<Object> get props => [
        status,
      ];
}

enum EmailVerificationStatus {
  initial,
  mailSending,
  success,
  failure,
}
