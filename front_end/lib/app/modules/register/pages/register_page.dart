import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pandora_front/app/modules/register/controllers/register_controller.dart';
import 'package:pandora_front/app/ui/widgets/my_button.dart';
import 'package:pandora_front/app/ui/widgets/my_textfield.dart';
import 'package:pandora_front/constants.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 25),
                  Image.asset(
                    'assets/images/pandora.png',
                    height: 100,
                  ),
                  const SizedBox(height: 25),
                  Text(
                    'register_account_message'.tr,
                    style: TextStyle(
                      color: myNinthColor,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 25),
                  MyTextField(
                    controller: controller.emailController,
                    hintText: 'E-mail',
                    obscureText: false,
                    enabled: true,
                  ),
                  const SizedBox(height: 10),
                  MyTextField(
                    controller: controller.passwordController,
                    hintText: 'password'.tr,
                    obscureText: true,
                    enabled: true,
                  ),
                  const SizedBox(height: 10),
                  MyTextField(
                    controller: controller.confirmPasswordController,
                    hintText: 'confirm_password'.tr,
                    obscureText: true,
                    enabled: true,
                  ),
                  const SizedBox(height: 25),
                  MyButton(
                    onTap: () {
                      controller.createUserWithEmailAndPassword();
                    },
                    text: 'signup'.tr,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
