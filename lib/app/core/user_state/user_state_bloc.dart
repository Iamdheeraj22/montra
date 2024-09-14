import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:montra/app/core/res/strings/app_messages.dart';
import 'package:montra/app/storage/storage_service.dart';

part 'user_state_event.dart';
part 'user_state_state.dart';

class UserStateBloc extends Bloc<UserStateEvent, UserStateState> {
  UserStateBloc() : super(const UserStateState()) {
    on<GetUserDetails>(_onGetUserDetails);
  }

  FutureOr<void> _onGetUserDetails(
    GetUserDetails event,
    Emitter<UserStateState> emit,
  ) async {
    final storage = StorageService.getInstance();
    final data = await Future.wait([
      storage.userUID,
      storage.email,
      storage.userFullName,
      storage.userType,
    ]);

    emit(state.copyWith(
      uid: data[0] ?? AppMessages.sNotAvailable,
      email: data[1] ?? AppMessages.sNotAvailable,
      name: data[2] ?? AppMessages.sNotAvailable,
      userType: data[3] ?? AppMessages.sNotAvailable,
    ));
  }
}
