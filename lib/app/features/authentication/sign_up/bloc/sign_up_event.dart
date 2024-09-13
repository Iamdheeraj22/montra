part of 'sign_up_bloc.dart';

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();
}

class SignUpAgreeChanged extends SignUpEvent {
  const SignUpAgreeChanged();

  @override
  List<Object> get props => [];
}

class SignUpPasswordVisibilityChanged extends SignUpEvent {
  const SignUpPasswordVisibilityChanged();

  @override
  List<Object> get props => [];
}

class Registration extends SignUpEvent {
  final String email;
  final String password;
  final String name;
  final int userType;

  const Registration({
    required this.email,
    required this.password,
    required this.name,
    required this.userType,
  });

  @override
  List<Object> get props => [
        email,
        password,
        name,
        userType,
      ];
}

class RegistrationWithGoogle extends SignUpEvent {
  const RegistrationWithGoogle();

  @override
  List<Object> get props => [];
}
