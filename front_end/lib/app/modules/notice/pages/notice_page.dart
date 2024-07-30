import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pandora_front/app/modules/notice/controllers/notice_controller.dart';
import 'package:pandora_front/app/modules/notice/widgets/my_card_notice.dart';
import 'package:pandora_front/app/routes/app_pages.dart';
import 'package:pandora_front/app/ui/pages/message_page.dart';
import 'package:pandora_front/app/ui/widgets/my_drawer.dart';
import 'package:pandora_front/constants.dart';

class NoticePage extends GetView<NoticeController> {
  const NoticePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.getNotices(),
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
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: controller.getItems().map((notice) =>
                      MyCardNotice(
                        url: notice.url!,
                        image: notice.image!,
                        title: notice.title!,
                        date: notice.date!,
                      ),
                  ).toList(),
                ),
              ),
            );
          }
        }
    );
  }
}