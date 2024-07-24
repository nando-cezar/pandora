import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pandora_front/app/modules/settings/controllers/settings_controller.dart';
import 'package:pandora_front/app/modules/settings/widgets/my_card_profile.dart';
import 'package:pandora_front/app/modules/settings/widgets/my_card_settings.dart';
import 'package:pandora_front/app/routes/app_pages.dart';
import 'package:pandora_front/app/ui/widgets/my_drawer.dart';
import 'package:pandora_front/constants.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(
        onPressed: () => Get.offAllNamed(Routes.dashboard),
      ),
      drawer: const MyDrawer(),
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MyCardProfile(),
                const SizedBox(height: 10.0),
                const MyCardSettings(),
                const SizedBox(height: 20.0),
                Text(
                  "general_settings".tr,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Obx(
                  () => SwitchListTile(
                    activeColor: myThirdColor,
                    contentPadding: const EdgeInsets.all(0),
                    value: controller.isDarkMode,
                    title: Text(
                      'dark_mode'.tr,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    onChanged: controller.toggleTheme,
                  ),
                ),
                const SizedBox(height: 20.0),
                Text(
                  "notification_settings".tr,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SwitchListTile(
                  activeColor: myFirstColor,
                  contentPadding: const EdgeInsets.all(0),
                  value: false,
                  title: Text("received_notification".tr,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.normal,
                      )),
                  onChanged: null,
                ),
                SwitchListTile(
                  activeColor: myFirstColor,
                  contentPadding: const EdgeInsets.all(0),
                  value: false,
                  title: Text(
                    "received_newsletter".tr,
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  onChanged: null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
