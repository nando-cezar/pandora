import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pandora_front/app/modules/settings/controllers/settings_controller.dart';
import 'package:pandora_front/app/modules/settings/widgets/my_card_profile.dart';
import 'package:pandora_front/app/modules/settings/widgets/my_card_settings.dart';
import 'package:pandora_front/app/ui/theme/theme_provider.dart';
import 'package:pandora_front/app/ui/widgets/my_drawer.dart';
import 'package:pandora_front/constants.dart';
import 'package:provider/provider.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var verifyDarkMode =
        Provider.of<ThemeProvider>(Get.context!).themeData.brightness ==
            Brightness.dark;

    return Scaffold(
      appBar: myAppBar(),
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
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: myFirstColor,
                  ),
                ),
                SwitchListTile(
                  activeColor: myFirstColor,
                  contentPadding: const EdgeInsets.all(0),
                  value: verifyDarkMode ? true : false,
                  title: Text('dark_mode'.tr),
                  onChanged: controller.toggleTheme,
                ),
                const SizedBox(height: 20.0),
                Text(
                  "notification_settings".tr,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: myFirstColor,
                  ),
                ),
                SwitchListTile(
                  activeColor: myFirstColor,
                  contentPadding: const EdgeInsets.all(0),
                  value: false,
                  title: Text("received_notification".tr),
                  onChanged: null,
                ),
                SwitchListTile(
                  activeColor: myFirstColor,
                  contentPadding: const EdgeInsets.all(0),
                  value: false,
                  title: Text("received_newsletter".tr),
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
