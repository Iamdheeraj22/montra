import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:montra/app/core/res/strings/app_messages.dart';
import 'package:tuple/tuple.dart';

class AuthenticationService {
  AuthenticationService._internal();
  static final AuthenticationService _instance =
      AuthenticationService._internal();
  factory AuthenticationService() => _instance;

  ///Email Login Method
  Future<Tuple2<User?, String?>> loginEmail({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Tuple2(credential.user, null);
    } on FirebaseAuthException catch (e) {
      log('Error: ${e.code}');
      if (e.code == 'user-not-found') {
        return const Tuple2(null, AppMessages.sUserNotFound);
      } else if (e.code == 'wrong-password') {
        return const Tuple2(null, AppMessages.sWrongPassword);
      } else if (e.code == 'invalid-credential') {
        return const Tuple2(null, AppMessages.sInvalidCredential);
      } else {
        return Tuple2(null, e.message ?? AppMessages.sSomeThingWentWrong);
      }
    } catch (e) {
      return Tuple2(null, e.toString());
    }
  }

  ///Registration Method with Email
  Future<Tuple2<User?, String?>> registrationEmail({
    required String email,
    required String password,
  }) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Tuple2(credential.user, null);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return const Tuple2(null, AppMessages.sWeakPassword);
      } else if (e.code == 'email-already-in-use') {
        return const Tuple2(null, AppMessages.sAlreadyExistUser);
      } else {
        return Tuple2(null, e.message ?? AppMessages.sSomeThingWentWrong);
      }
    } catch (e) {
      return Tuple2(null, e.toString());
    }
  }

  ///Send Email Verification
  Future<Tuple2<bool, String?>> sendEmailVerification({
    required String email,
  }) async {
    ///Send Email Verification via mail to the user
    try {
      final user = FirebaseAuth.instance.currentUser;
      await user?.sendEmailVerification();
      return const Tuple2(true, null);
    } on FirebaseAuthException catch (e) {
      return Tuple2(false, e.message ?? AppMessages.sSomeThingWentWrong);
    } catch (e) {
      return Tuple2(false, e.toString());
    }
  }
}
