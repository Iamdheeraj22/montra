import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:montra/app/core/res/strings/app_messages.dart';
import 'package:montra/app/core/utils/toast_message.dart';
import 'package:montra/app/features/authentication/authentication_service/authentication_service.dart';
import 'package:montra/app/storage/storage_service.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<PasswordVisibility>(_onPasswordVisibility);
    on<LoginWithEmail>(_onLoginWithEmail);
    on<LoginWithGoogle>(_onLoginWithGoogle);
    on<SaveUserData>(_onSaveUserData);
  }

  FutureOr<void> _onPasswordVisibility(
      PasswordVisibility event, Emitter<LoginState> emit) {
    emit(state.copyWith(
      isPasswordVisible: !state.isPasswordVisible,
    ));
  }

  FutureOr<void> _onLoginWithEmail(
    LoginWithEmail event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(status: LoginStatus.login));
    try {
      final result = await AuthenticationService().loginEmail(
        email: event.email,
        password: event.password,
      );
      final user = result.item1;
      if (user != null) {
        if (!user.emailVerified) {
          emit(state.copyWith(status: LoginStatus.emailNotVerified));
          ToastMessage().show(message: AppMessages.sEmailNotVerifiedMessage);
          emit(state.copyWith(status: LoginStatus.failure));
          return;
        }
        add(SaveUserData(uid: user.uid));
        return;
      } else {
        ToastMessage()
            .show(message: result.item2 ?? AppMessages.sSomeThingWentWrong);
        emit(state.copyWith(status: LoginStatus.failure));
        return;
      }
    } catch (e) {
      emit(state.copyWith(status: LoginStatus.failure));
      return;
    }
  }

  FutureOr<void> _onLoginWithGoogle(
    LoginWithGoogle event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(status: LoginStatus.loginWithGoogle));
    try {
      final result = await AuthenticationService().signInWithGoogle();
      final user = result.item1;
      if (user != null) {
        //Check the email is exist or not
        if (user.emailVerified) {
          final isExist = await AuthenticationService().isEmailExist(user.uid);
          if (!isExist) {
            emit(state.copyWith(status: LoginStatus.failure));
            ToastMessage().show(message: AppMessages.sEmailNotRegistered);
            await AuthenticationService().signOut();
            return;
          } else {
            add(SaveUserData(uid: user.uid));
            AuthenticationService().signOut();
            return;
          }
        } else {
          emit(state.copyWith(status: LoginStatus.emailNotVerified));
          ToastMessage().show(message: AppMessages.sEmailNotVerifiedMessage);
          emit(state.copyWith(status: LoginStatus.failure));
          AuthenticationService().signOut();
          return;
        }
      } else {
        ToastMessage()
            .show(message: result.item2 ?? AppMessages.sSomeThingWentWrong);
        emit(state.copyWith(status: LoginStatus.failure));
        AuthenticationService().signOut();
        return;
      }
    } catch (e) {
      emit(state.copyWith(status: LoginStatus.failure));
      AuthenticationService().signOut();
      return;
    }
  }

  FutureOr<void> _onSaveUserData(
    SaveUserData event,
    Emitter<LoginState> emit,
  ) async {
    final DatabaseReference ref =
        FirebaseDatabase.instance.ref("users").child(event.uid);
    final userData = await ref.get();
    final storage = StorageService.getInstance();
    if (userData.exists) {
      await Future.wait([
        storage.saveUserFullName(userData.child('name').key ?? ''),
        storage.saveEmail(userData.child('email').key ?? ''),
        storage.saveUserType(userData.child('userType').key ?? ''),
        storage.saveUserUID(userData.child('uid').key ?? ''),
        storage.saveIsLogin(true)
      ]);
      emit(state.copyWith(status: LoginStatus.success));
      return;
    } else {
      emit(state.copyWith(status: LoginStatus.failure));
      ToastMessage().show(message: AppMessages.sUserDetailsNotFound);
      return;
    }
  }
}
