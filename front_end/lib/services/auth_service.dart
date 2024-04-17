import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../constants.dart';

class AuthService {

  signInWithGoogle() async {

    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication gAuth = await gUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

    } catch (error) {
      return error;
    }
  }

  signIn(email, password, BuildContext context) async {

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (context.mounted) Get.back();
    } on FirebaseAuthException catch (e) {
      if (context.mounted) Get.back();

      if (e.code == 'invalid-credential') {
        if (context.mounted) myShowDialog('Invalid credential.');
      } else if (e.code == 'invalid-email') {
        if (context.mounted) myShowDialog('Invalid e-mail.');
      }
    }
  }
}