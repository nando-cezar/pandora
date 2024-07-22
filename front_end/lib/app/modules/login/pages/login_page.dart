import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:pandora_front/app/modules/login/controllers/login_controller.dart';
import 'package:pandora_front/app/routes/app_pages.dart';
import 'package:pandora_front/app/ui/widgets/my_button.dart';
import 'package:pandora_front/app/ui/widgets/my_square_tile.dart';
import 'package:pandora_front/app/ui/widgets/my_textfield.dart';
import 'package:pandora_front/constants.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    'PANDORA',
                    style: TextStyle(
                      color: myTenthColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ).animate()
                      .fadeIn(duration: 600.ms)
                      .then(delay: 200.ms) // baseline=800ms
                      .slide(),

                  const SizedBox(height: 10),

                  Text(
                    'welcome'.tr,
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

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () => Get.toNamed(Routes.forgotPassword),
                          child: Text(
                            'forgot_password?'.tr,
                            style: TextStyle(color: myNinthColor),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  MyButton(
                    onTap: () {
                      controller.signInWithEmailAndPassword();
                    },
                    text: 'signin'.tr,
                  ),

                  const SizedBox(height: 30),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: mySixthColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'or_continue_with'.tr,
                            style: TextStyle(color: myNinthColor),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: mySixthColor,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MySquareTile(
                        onTap: () => controller.signInWithGoogle(),
                        imagePath: 'assets/images/google.png',
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'not_a_member?'.tr,
                        style: TextStyle(color: myNinthColor),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () => Get.toNamed(Routes.register),
                        child: Text(
                          'register_now'.tr,
                          style: TextStyle(
                            color: myThirdColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
