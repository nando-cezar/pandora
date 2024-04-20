import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pandora_front/components/my_button.dart';
import 'package:pandora_front/components/my_textfield.dart';
import 'package:pandora_front/components/square_tile.dart';
import 'package:pandora_front/services/auth_service.dart';

import '../../constants.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

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
                  const SizedBox(height: 25),

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
                  ),

                  const SizedBox(height: 10),

                  Text(
                    'Let\'s create an account for you!',
                    style: TextStyle(
                      color: myNinthColor,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 25),

                  MyTextField(
                    controller: emailController,
                    hintText: 'E-mail',
                    obscureText: false,
                    enabled: true,
                  ),

                  const SizedBox(height: 10),

                  MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                    enabled: true,
                  ),

                  const SizedBox(height: 10),

                  MyTextField(
                    controller: confirmPasswordController,
                    hintText: 'Confirm password',
                    obscureText: true,
                    enabled: true,
                  ),

                  const SizedBox(height: 25),

                  MyButton(
                    onTap: _signUserUp,
                    text: "Sign Up",
                  ),

                  const SizedBox(height: 50),

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

                  const SizedBox(height: 50),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SquareTile(
                        onTap: () => AuthService().signInWithGoogle(),
                        imagePath: 'assets/images/google.png',
                      ),

                      const SizedBox(width: 25),

                      SquareTile(
                        onTap: () => {},
                        imagePath: 'assets/images/apple.png',
                      )
                    ],
                  ),

                  const SizedBox(height: 50),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(color: myNinthColor),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          'Login now',
                          style: TextStyle(
                            color: myFirstColor,
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

  void _signUserUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        myShowDialog('Passwords don\'t match.');
      }

      Get.back();
    } on FirebaseAuthException catch (e) {
      Get.back();

      if (e.code == 'weak-password') {
        myShowDialog('Weak password.');
      } else if (e.code == 'invalid-email') {
        myShowDialog('Invalid e-mail.');
      }
    }
  }
}
