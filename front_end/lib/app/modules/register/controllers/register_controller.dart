import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pandora_front/app/data/repository/auth_repository.dart';

class RegisterController extends GetxController {
  final AuthRepository repository;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  RegisterController({required this.repository});

  createUserWithEmailAndPassword() async {
    if(passwordController.text == confirmPasswordController.text) {
      await repository.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      ).then((value){
        if(value!= null){
          Get.snackbar(
            'success'.tr,
            'register_successfully'.tr,
            icon: const Icon(Icons.check),
          );
        }
      }).catchError((e){
        Get.snackbar('error'.tr, e.toString());
      });
    } else {
      Get.snackbar('error'.tr, 'incompatible_passwords'.tr);
    }

  }
}