import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../constants.dart';
import '../controller/user_credential_controller.dart';

class AuthService {

  final _controllerUserCredential = Get.put(UserCredentialController());

  signInWithGoogle() async {

    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication gAuth = await gUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

      setUserCredential(userCredential);

    } catch (error) {
      return error;
    }
  }

  signIn(email, password, BuildContext context) async {

    try {
      final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      setUserCredential(userCredential);

      if (context.mounted) Navigator.of(context).pop();
    } on FirebaseAuthException catch (e) {
      if (context.mounted) Navigator.of(context).pop();

      if (e.code == 'invalid-credential') {
        if (context.mounted) myShowDialog(context, 'Invalid credential.');
      } else if (e.code == 'invalid-email') {
        if (context.mounted) myShowDialog(context, 'Invalid e-mail.');
      }
    }
  }

  void setUserCredential(UserCredential userCredential) {
    _controllerUserCredential.userCredential.value.photoURL = userCredential.user?.photoURL ?? 'https://cdn.iconscout.com/icon/free/png-256/free-avatar-370-456322.png';
    _controllerUserCredential.userCredential.value.displayName = userCredential.user?.displayName ?? 'NOT APPLIED';
    _controllerUserCredential.userCredential.value.email = userCredential.user?.email ?? 'NOT APPLIED';
    _controllerUserCredential.userCredential.value.uid = userCredential.user?.uid ?? 'NOT APPLIED';
    _controllerUserCredential.userCredential.value.creationTime = userCredential.user?.metadata.creationTime ?? DateTime(2017, 9, 7, 17, 30);
    _controllerUserCredential.userCredential.value.lastSignInTime = userCredential.user?.metadata.lastSignInTime ?? DateTime(2017, 9, 7, 17, 30);
  }
}