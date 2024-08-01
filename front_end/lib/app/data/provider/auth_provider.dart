import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import 'package:pandora_front/app/data/model/user_model.dart';

class AuthProvider {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final _logger = Logger();

  Stream<UserModel?> get onAuthStateChanged =>
      _firebaseAuth.authStateChanges().map((User? currentUser) {
        if (currentUser != null) {
          _logInfo("Successfully authenticated.");
          return UserModel.fromFirebase(currentUser);
        }
        return null;
      });

  UserModel get currentUser =>
      UserModel.fromFirebase(_firebaseAuth.currentUser);

  Future<UserModel?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final currentUser = (await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;

      _logInfo("Successfully created user with email and password.");
      return UserModel.fromFirebase(currentUser!);
    } on FirebaseAuthException catch (error) {
      _handleAuthError(error);
    }
    return null;
  }

  Future<UserModel?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication gAuth = await gUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      final currentUser =
          (await _firebaseAuth.signInWithCredential(credential)).user;

      _logInfo("Successfully authenticated with Google.");
      return UserModel.fromFirebase(currentUser!);
    } on FirebaseAuthException catch (error) {
      _handleAuthError(error);
    }
    return null;
  }

  Future<UserModel?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final currentUser = (await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;

      _logInfo("Successfully authenticated with email and password.");
      return UserModel.fromFirebase(currentUser!);
    } on FirebaseAuthException catch (error) {
      _handleAuthError(error);
    }
    return null;
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      _logInfo("Password reset email sent successfully.");
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: email,
      );
    } on FirebaseAuthException catch (error) {
      _handleAuthError(error);
    }
  }

  Future<void> signOut() {
    _logInfo("User signed out.");
    return _firebaseAuth.signOut();
  }

  void _handleAuthError(FirebaseAuthException error) {
    _logger.e("Firebase Authentication Error", error: error);
    throw Exception('${'error_message_firebase'.tr}\n${error.message!}');
  }

  void _logInfo(String message) {
    _logger.i("AuthProvider: $message");
  }
}
