import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pandora_front/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:pandora_front/app/routes/app_pages.dart';
import 'package:pandora_front/app/ui/pages/message_page.dart';
import 'package:pandora_front/app/ui/widgets/my_drawer.dart';
import 'package:pandora_front/constants.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.dataController.getGeneralData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MessagePage(message: 'preparing_data'.tr);
        } else if (snapshot.hasError) {
          return MessagePage(
            message: 'error_message'.tr,
          );
        } else {
          return Scaffold(
            appBar: myAppBar(
              onPressed: () => Get.offAllNamed(Routes.dashboard),
            ),
            drawer: const MyDrawer(),
            body: Obx(() => controller.listPages[controller.index.value]),
            bottomNavigationBar: GNav(
              padding: const EdgeInsetsDirectional.symmetric(vertical: 10),
              backgroundColor: mySecondColor,
              activeColor: myFifthColor,
              color: myFifthColor,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              gap: 8,
              tabs: const [
                GButton(
                  padding: EdgeInsets.all(10),
                  icon: Icons.dashboard,
                  text: 'Dashboard',
                ),
                GButton(
                  padding: EdgeInsets.all(10),
                  icon: Icons.map,
                  text: 'Map',
                ),
              ],
              onTabChange: (index) {
                controller.index.value = index;
              },
            ),
          );
        }
      },
    );
  }
}
