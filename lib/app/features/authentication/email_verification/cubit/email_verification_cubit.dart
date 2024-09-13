import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:montra/app/core/res/strings/app_messages.dart';
import 'package:montra/app/core/utils/toast_message.dart';
import 'package:montra/app/features/authentication/authentication_service/authentication_service.dart';

part 'email_verification_state.dart';

class EmailVerificationCubit extends Cubit<EmailVerificationState> {
  EmailVerificationCubit() : super(const EmailVerificationState());

  FutureOr<void> verificationEmail({required String email}) async {
    emit(
      const EmailVerificationState(status: EmailVerificationStatus.mailSending),
    );
    try {
      final result =
          await AuthenticationService().sendEmailVerification(email: email);
      if (result.item1) {
        emit(const EmailVerificationState(
            status: EmailVerificationStatus.success));
        ToastMessage().show(
          message: AppMessages.sEmailVerificationSuccess,
        );
        return;
      } else {
        emit(const EmailVerificationState(
            status: EmailVerificationStatus.failure));
        ToastMessage()
            .show(message: result.item2 ?? AppMessages.sSomeThingWentWrong);
        return;
      }
    } catch (e) {
      emit(const EmailVerificationState(
          status: EmailVerificationStatus.failure));
      ToastMessage().show(message: e.toString());
      return;
    }
  }
}
