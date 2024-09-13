import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:montra/app/core/res/strings/app_messages.dart';
import 'package:montra/app/core/utils/toast_message.dart';
import 'package:montra/app/features/authentication/authentication_service/authentication_service.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(const SignUpState()) {
    on<SignUpAgreeChanged>(_onSignUpAgreeChanged);
    on<SignUpPasswordVisibilityChanged>(_onSignUpPasswordVisibilityChanged);
    on<Registration>(_onRegistration);
  }

  FutureOr<void> _onSignUpPasswordVisibilityChanged(
      SignUpPasswordVisibilityChanged event, Emitter<SignUpState> emit) {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  FutureOr<void> _onSignUpAgreeChanged(
      SignUpAgreeChanged event, Emitter<SignUpState> emit) {
    emit(state.copyWith(isAgree: !state.isAgree));
  }

  FutureOr<void> _onRegistration(
    Registration event,
    Emitter<SignUpState> emit,
  ) async {
    emit(state.copyWith(status: SignUpStatus.registering));
    try {
      final result = await AuthenticationService().registrationEmail(
        email: event.email,
        password: event.password,
      );
      final user = result.item1;
      if (user != null) {
        DatabaseReference databaseReference =
            FirebaseDatabase.instance.ref().child('users/${user.uid}');
        databaseReference.set({
          'name': event.name,
          'email': event.email,
          'uid': user.uid,
        });
        emit(state.copyWith(status: SignUpStatus.success));
        return;
      }
      ToastMessage()
          .show(message: result.item2 ?? AppMessages.sSomeThingWentWrong);
      emit(state.copyWith(status: SignUpStatus.failure));
      return;
    } catch (e) {
      ToastMessage().show(message: e.toString());
      emit(state.copyWith(status: SignUpStatus.failure));
      return;
    }
  }
}
