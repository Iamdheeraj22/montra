part of 'login_bloc.dart';

@immutable
sealed class LoginEvent extends Equatable {}

class PasswordVisibility extends LoginEvent {
  PasswordVisibility();
  @override
  List<Object?> get props => [];
}
