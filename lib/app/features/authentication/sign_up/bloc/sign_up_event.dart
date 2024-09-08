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
