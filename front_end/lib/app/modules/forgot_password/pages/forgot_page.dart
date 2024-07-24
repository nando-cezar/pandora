import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pandora_front/app/modules/forgot_password/controllers/forgot_controller.dart';
import 'package:pandora_front/app/ui/widgets/my_button.dart';
import 'package:pandora_front/app/ui/widgets/my_textfield.dart';
import 'package:pandora_front/constants.dart';

class ForgotPasswordPage extends GetView<ForgotPasswordController> {
  const ForgotPasswordPage({super.key});

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
                  const SizedBox(height: 50),
                  Image.asset(
                    'assets/images/pandora.png',
                    height: 100,
                  ),
                  const SizedBox(height: 25),
                  Text(
                    'forgot_password!'.tr,
                    style: TextStyle(
                      color: myTenthColor,
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Text(
                    'forgot_password_message'.tr,
                    style: TextStyle(
                      color: myEighthColor,
                      fontSize: 13,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 25),
                  MyTextField(
                    controller: controller.emailController,
                    hintText: 'E-mail',
                    obscureText: false,
                    enabled: true,
                  ),
                  const SizedBox(height: 25),
                  MyButton(
                    onTap: () {
                      controller.sendPasswordResetEmail();
                    },
                    text: 'reset_password'.tr,
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
