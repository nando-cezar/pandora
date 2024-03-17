import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../layout/base_layout.dart';
import 'login_or_register_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.hasData) {
            return const BaseLayout();
          } else {
            return const LoginOrRegisterPage();
          }
        },
      ),
    );
  }
}
