import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pandora_front/app/data/repository/auth_repository.dart';

class ForgotPasswordController extends GetxController {
  final AuthRepository repository;
  final emailController = TextEditingController();

  ForgotPasswordController({required this.repository});

  sendPasswordResetEmail() async {
    await repository
        .sendPasswordResetEmail(
      email: emailController.text,
    )
        .then((value) {
      Get.snackbar(
        'Success',
        'Password reset link sent! \nCheck your e-mail.',
        icon: const Icon(Icons.check),
      );
    }).catchError((e) {
      Get.snackbar(
        'Error',
        e.toString(),
      );
    });
  }
}
