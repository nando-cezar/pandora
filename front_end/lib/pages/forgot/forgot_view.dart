import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/my_button.dart';
import '../../components/my_textfield.dart';
import '../../constants.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailController = TextEditingController();

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
                    'Forgot password!',
                    style: TextStyle(
                      color: myTenthColor,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 25),

                  Text(
                    'Enter your e-mail ans we will send you a password reset link.',
                    style: TextStyle(
                      color: myEighthColor,
                      fontSize: 13,
                    ),
                  ),

                  const SizedBox(height: 25),

                  MyTextField(
                    controller: emailController,
                    hintText: 'E-mail',
                    obscureText: false,
                    enabled: true,
                  ),

                  const SizedBox(height: 25),

                  MyButton(
                    onTap: _resetPassword,
                    text: "Reset password",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _resetPassword() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text,
      );

      Get.back();
      myShowDialog('Password reset link sent! \nCheck your e-mail.');

    } on FirebaseAuthException catch (e) {

      Get.back();
      myShowDialog(e.message.toString());
    }
  }
}
