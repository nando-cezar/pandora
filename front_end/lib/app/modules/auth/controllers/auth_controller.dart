import 'package:get/get.dart';
import 'package:pandora_front/app/data/model/user_model.dart';
import 'package:pandora_front/app/data/repository/auth_repository.dart';

class AuthController extends GetxController {
  final AuthRepository repository;

  AuthController({required this.repository});

  Stream<UserModel?> get onAuthStateChanged => repository.onAuthStateChanged;

  UserModel get currentUser => repository.currentUser;

  signOut() => repository.signOut();
}