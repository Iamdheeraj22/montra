import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:montra/app/core/res/strings/app_messages.dart';
import 'package:tuple/tuple.dart';

class AuthenticationService {
  AuthenticationService._internal();

  static final AuthenticationService _instance =
      AuthenticationService._internal();

  factory AuthenticationService() => _instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  GoogleSignInAuthentication? googleSignInAuthentication;
  GoogleSignInAccount? googleSignInAccount;

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

  Future<Tuple2<User?, String?>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        googleSignInAuthentication = await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication!.accessToken,
          idToken: googleSignInAuthentication!.idToken,
        );
        UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        if (userCredential.user != null) {
          return Tuple2(userCredential.user, null);
        }

        return const Tuple2(null, AppMessages.sSomeThingWentWrong);
      }
      return const Tuple2(null, AppMessages.sSomeThingWentWrong);
    } catch (e) {
      return Tuple2(null, e.toString());
    }
  }

  Future<bool> signOut() async {
    await _auth.signOut().whenComplete(() async {
      await googleSignIn.signOut().then((result) async {
        if (result != null) {
          log('result :$result');
          return false;
        }
        return true;
      }, onError: (e) {
        return false;
      });
    });
    return true;
  }

  Future<bool> isEmailExist(String uid) async {
    try {
      DatabaseReference ref = FirebaseDatabase.instance.ref("users");
      final snapshot = await ref.child(uid).get();
      return snapshot.exists;
    } catch (e) {
      return false;
    }
  }
}
/*
Assuming you have already deleted the Firebase user by
 calling await FirebaseAuth.instance.currentUser?.delete(); The next step will
 be to call await GoogleSignIn().disconnect(); with the Flutter Google SignIn plugin.
*/
