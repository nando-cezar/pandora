import 'package:firebase_auth/firebase_auth.dart';

class UserCredentialModel {
  String photoURL =
      'https://cdn.iconscout.com/icon/free/png-256/free-avatar-370-456322.png';
  String displayName = 'undefined';
  String email = 'undefined@undefined';
  String uid = 'undefined';
  DateTime creationTime = DateTime.now();
  DateTime lastSignInTime = DateTime.now();

  void updateUserCredential(User user) {
    photoURL = user.photoURL ?? photoURL;
    displayName = user.displayName ?? displayName;
    email = user.email ?? email;
    uid = user.uid;
    creationTime = user.metadata.creationTime ?? DateTime.now();
    lastSignInTime = user.metadata.lastSignInTime ?? DateTime.now();
  }
}
