import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:medical/core/errors/faliure.dart';

class FirebaseFailure extends Failure {
  FirebaseFailure({required super.errMessage});
  factory FirebaseFailure.fromFirebaseAuthException(FirebaseAuthException e) {
    if (e.code == 'user-not-found') {
      return FirebaseFailure(errMessage: 'No user found for that email.');
    } else if (e.code == 'wrong-password') {
      return FirebaseFailure(
        errMessage: 'Wrong password provided for that user.',
      );
    } else if (e.code == 'invalid-credential') {
      return FirebaseFailure(
        errMessage: 'Wrong password provided for that user.',
      );
    } else {
      log(e.code);
      log(e.message ?? '');
      return FirebaseFailure(errMessage: e.message ?? '');
    }
  }
}
