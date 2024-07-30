import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pandora_front/app/data/model/notice_model.dart';
import 'package:pandora_front/app/data/repository/notice_repository.dart';

class NoticeController extends GetxController {
  final NoticeRepository repository;
  List<NoticeModel> _items = <NoticeModel>[];

  NoticeController({
    required this.repository,
  });

  Future<void> getNotices() async {
    await repository
        .getNotices(
      search: 'Eventos extremos',
      hl: 'pt-BR',
      gl: 'BR',
      ceid: 'BR%3Apt-419',
    )
        .then((value) {
      updateItems(value.notices);
      Get.snackbar(
        'success'.tr,
        'success_message'.tr,
        icon: const Icon(Icons.check),
      );
    }).catchError((e) {
      Get.snackbar(
        'error'.tr,
        e.toString(),
        icon: const Icon(Icons.cancel_outlined),
      );
    });
  }

  updateItems(List<NoticeModel> items) => _items = items;

  List<NoticeModel> getItems() => _items;
}
