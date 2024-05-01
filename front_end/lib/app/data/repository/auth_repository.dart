import 'package:pandora_front/app/data/model/user_model.dart';
import 'package:pandora_front/app/data/provider/auth_provider.dart';

class AuthRepository {
  final authProvider = AuthProvider();

  Stream<UserModel?> get onAuthStateChanged => authProvider.onAuthStateChanged;

  UserModel get currentUser => authProvider.currentUser;

  Future<UserModel?> createUserWithEmailAndPassword({email, password}) {
      return authProvider.createUserWithEmailAndPassword(email, password);
  }

  Future<UserModel?> signInWithGoogle() {
    return authProvider.signInWithGoogle();
  }

  Future<UserModel?> signInWithEmailAndPassword({email, password}) {
    return authProvider.signInWithEmailAndPassword(email, password);
  }

  Future<void> sendPasswordResetEmail({email}) async {
    return authProvider.sendPasswordResetEmail(email);
  }

  signOut() => authProvider.signOut();

}