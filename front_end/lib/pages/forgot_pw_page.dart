import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';
import '../constants.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  final emailController = TextEditingController();

  void resetPassword() async {
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

      Navigator.pop(context);
      ErrorMessage('Password reset link sent! \nCheck your e-mail.');

    } on FirebaseAuthException catch (e) {

      Navigator.pop(context);
      ErrorMessage(e.message.toString());
    }
  }

  void ErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: myFirstColor,
          title: Center(
            child: Text(
              message,
              style: TextStyle(
                color: myFifthColor,
                fontSize: 16,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),

                Image.asset(
                  'assets/images/pandora.png',
                  height: 100,
                ),

                const SizedBox(height: 25),

                // welcome back, you've been missed!
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

                // email textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'E-mail',
                  obscureText: false,
                ),

                const SizedBox(height: 25),

                MyButton(
                  onTap: resetPassword,
                  text: "Reset password",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
