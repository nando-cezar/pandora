import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/my_drawer.dart';
import '../components/my_navbar.dart';
import '../constants.dart';
import '../controller/pages_controller.dart';

class BaseLayout extends StatelessWidget {
  final PagesController controller = Get.put(PagesController());

  BaseLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar,
      drawer: MyDrawer(controller: controller),
      body: Obx(() => controller.pages[controller.index.value]),
      bottomNavigationBar: Obx(
        () => MyNavBar(
          controller: controller,
          value: controller.index.value,
        ),
      ),
    );
  }
}
