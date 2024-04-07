class UserCredentialModel {

  String? photoURL;
  String? displayName;
  String? email;
  String? uid;
  DateTime? creationTime;
  DateTime? lastSignInTime;

  UserCredentialModel({
    this.photoURL,
    this.displayName,
    this.email,
    this.uid,
    this.creationTime,
    this.lastSignInTime
  });
}