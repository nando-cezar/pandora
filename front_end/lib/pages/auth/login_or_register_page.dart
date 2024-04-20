import 'package:flutter/material.dart';
import 'package:pandora_front/pages/register/register_view.dart';
import '../login/login_view.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPage();
}

class _LoginOrRegisterPage extends State<LoginOrRegisterPage> {
  bool showLoginPage = true;

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
        onTap: _togglePages,
      );
    } else {
      return RegisterPage(
        onTap: _togglePages,
      );
    }
  }

  void _togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }
}
