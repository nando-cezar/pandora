import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pandora_front/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:pandora_front/app/modules/dashboard/layout/desktop_scaffold.dart';
import 'package:pandora_front/app/modules/dashboard/layout/mobile_scaffold.dart';
import 'package:pandora_front/app/modules/dashboard/layout/responsive_layout.dart';
import 'package:pandora_front/app/modules/dashboard/layout/tablet_scaffold.dart';
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
            appBar: myAppBar(),
            drawer: const MyDrawer(),
            body: const ResponsiveLayout(
              mobileScaffold: MobileScaffold(),
              tabletScaffold: TableScaffold(),
              desktopScaffold: DesktopScaffold(),
            ),
          );
        }
      },
    );
  }
}
