import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pandora_front/app/data/repository/auth_repository.dart';

class LoginController extends GetxController {
  final AuthRepository repository;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginController({required this.repository});

  signInWithEmailAndPassword() async {
    await repository
        .signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    )
        .then((value) {
      if (value != null) {
        Get.snackbar(
          'Success',
          'Login successfully',
          icon: const Icon(Icons.check),
        );
      }
    }).catchError((e) {
      Get.snackbar(
        'Error',
        e.toString(),
        icon: const Icon(Icons.cancel_outlined),
      );
    });
  }

   signInWithGoogle() async {
    await repository.signInWithGoogle().then((value) {
      if (value != null) {
        Get.snackbar(
          'Success',
          'Login successfully',
          icon: const Icon(Icons.check),
        );
      }
    }).catchError((e) {
      Get.snackbar(
        'Error',
        e.toString(),
        icon: const Icon(Icons.cancel_outlined),
      );
    });
  }
}
