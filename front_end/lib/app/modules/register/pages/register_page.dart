import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pandora_front/app/modules/register/controllers/register_controller.dart';
import 'package:pandora_front/app/ui/widgets/my_button.dart';
import 'package:pandora_front/app/ui/widgets/my_square_tile.dart';
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
                    'Let\'s create an account for you!',
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
                    hintText: 'Password',
                    obscureText: true,
                    enabled: true,
                  ),
                  const SizedBox(height: 10),
                  MyTextField(
                    controller: controller.confirmPasswordController,
                    hintText: 'Confirm password',
                    obscureText: true,
                    enabled: true,
                  ),
                  const SizedBox(height: 25),
                  MyButton(
                    onTap: () {
                      controller.createUserWithEmailAndPassword();
                    },
                    text: "Sign Up",
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
                            'Or continue with',
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
                        onTap: () => {},
                        imagePath: 'assets/images/google.png',
                      ),
                      const SizedBox(width: 25),
                      MySquareTile(
                        onTap: () => {},
                        imagePath: 'assets/images/apple.png',
                      )
                    ],
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
