import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(const SignUpState()) {
    on<SignUpAgreeChanged>(_onSignUpAgreeChanged);
    on<SignUpPasswordVisibilityChanged>(_onSignUpPasswordVisibilityChanged);
  }

  FutureOr<void> _onSignUpPasswordVisibilityChanged(
      SignUpPasswordVisibilityChanged event, Emitter<SignUpState> emit) {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  FutureOr<void> _onSignUpAgreeChanged(
      SignUpAgreeChanged event, Emitter<SignUpState> emit) {
    emit(state.copyWith(isAgree: !state.isAgree));
  }
}
