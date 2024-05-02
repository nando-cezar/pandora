import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String? uid;
  String? displayName;
  String? email;
  String? photoURL;
  DateTime creationTime = DateTime.now();
  DateTime lastSignInTime = DateTime.now();

  UserModel({
    required this.uid,
    required this.displayName,
    required this.email,
    required this.photoURL,
  });

  UserModel.fromFirebase(User? data) {
    uid = data!.uid;
    displayName = data.displayName;
    email = data.email;
    photoURL = data.photoURL;
    creationTime = data.metadata.creationTime!;
    lastSignInTime = data.metadata.lastSignInTime!;
  }

  Object toJson() {
    final Map<String, Object> json = <String, Object>{};

    void addIfPresent(String fieldName, Object? value) {
      if (value != null) {
        json[fieldName] = value;
      }
    }

    addIfPresent('uid', uid);
    addIfPresent('displayName', displayName);
    addIfPresent('email', email);
    addIfPresent('photoURL', photoURL);

    return json;
  }

  UserModel.mock(){
    uid = 'Undefined';
    displayName = 'Undefined';
    email = 'Undefined';
    photoURL = 'https://cdn.iconscout.com/icon/free/png-256/free-avatar-370-456322.png';
  }
}
