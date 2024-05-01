import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pandora_front/app/data/model/user_model.dart';
import 'package:pandora_front/app/modules/auth/controllers/auth_controller.dart';
import 'package:pandora_front/app/modules/login/pages/login_page.dart';
import 'package:pandora_front/app/modules/root/pages/root_page.dart';

class AuthPage extends GetView<AuthController> {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<UserModel?>(
        stream: controller.onAuthStateChanged,
        builder: (BuildContext context, AsyncSnapshot<UserModel?> snapshot) {
          if (snapshot.hasData) {
            return const RootPage();
          } else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
