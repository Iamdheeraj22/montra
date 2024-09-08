part of 'sign_up_bloc.dart';

final class SignUpState extends Equatable {
  final bool isAgree;
  final bool isPasswordVisible;

  const SignUpState({this.isAgree = false, this.isPasswordVisible = false});

  SignUpState copyWith({bool? isAgree, bool? isPasswordVisible}) {
    return SignUpState(
      isAgree: isAgree ?? this.isAgree,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }

  @override
  List<Object> get props => [
        isAgree,
        isPasswordVisible,
      ];
}
