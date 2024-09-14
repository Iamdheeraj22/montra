part of 'login_bloc.dart';

@immutable
sealed class LoginEvent extends Equatable {}

class PasswordVisibility extends LoginEvent {
  PasswordVisibility();
  @override
  List<Object?> get props => [];
}

class LoginWithEmail extends LoginEvent {
  final String email;
  final String password;
  LoginWithEmail({
    required this.email,
    required this.password,
  });
  @override
  List<Object?> get props => [email, password];
}

class LoginWithGoogle extends LoginEvent {
  LoginWithGoogle();
  @override
  List<Object?> get props => [];
}

class SaveUserData extends LoginEvent {
  SaveUserData({required this.uid});
  final String uid;
  @override
  List<Object?> get props => [
        uid,
      ];
}
