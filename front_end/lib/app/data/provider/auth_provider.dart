import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import 'package:pandora_front/app/data/model/user_model.dart';

class AuthProvider {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final _logger = Logger();

  Stream<UserModel?> get onAuthStateChanged =>
      _firebaseAuth.authStateChanges().map((User? currentUser) {
        if (currentUser != null) {
          _logger.i("AuthProvider: Successfully!");
          return UserModel.fromFirebase(currentUser);
        }
        return null;
      });

  UserModel get currentUser => UserModel.fromFirebase(_firebaseAuth.currentUser);

  Future<UserModel?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final currentUser = (await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;

      _logger.i("AuthProvider: Successfully!");
      return UserModel.fromFirebase(currentUser!);
    } on FirebaseAuthException catch (error) {
      _logger.e("Error log", error: error);
      throw Exception('Failed to firebase authentication!\n${error.message!}');
    }
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

      _logger.i("AuthProvider: Successfully!");
      return UserModel.fromFirebase(currentUser!);
    } on FirebaseAuthException catch (error) {
      _logger.e("Error log", error: error);
      throw Exception('Failed to firebase authentication!\n${error.message!}');
    }
  }

  Future<UserModel?> signInWithEmailAndPassword(email, password) async {
    try {
      final currentUser = (await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;
      _logger.i("AuthProvider: Successfully!");
      return UserModel.fromFirebase(currentUser!);
    } on FirebaseAuthException catch (error) {
      _logger.e("Error log", error: error);
      throw Exception('Failed to firebase authentication!\n${error.message!}');
    }
  }

  Future<void> sendPasswordResetEmail(email) async {
    try {
      _logger.i("AuthProvider: Successfully!");
      return await FirebaseAuth.instance.sendPasswordResetEmail(
        email: email,
      );
    } on FirebaseAuthException catch (error) {
      _logger.e("Error log", error: error);
      throw Exception('Failed to firebase authentication!\n${error.message!}');
    }
  }

  Future<void> signOut() {
    _logger.i("AuthProvider: Successfully!");
    return _firebaseAuth.signOut();
  }
}
