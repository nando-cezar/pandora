import 'package:get/get.dart';
import 'package:pandora_front/app/data/provider/notice_provider.dart';
import 'package:pandora_front/app/data/repository/notice_repository.dart';
import 'package:http/http.dart' as http;
import 'package:pandora_front/app/modules/notice/controllers/notice_controller.dart';

class NoticeBinding implements Bindings {
  @override
  void dependencies() {
    _registerRepositories();
    _registerControllers();
  }

  void _registerRepositories() {
    Get.lazyPut<NoticeRepository>(
      () => NoticeRepository(
        noticeProvider: NoticeProvider(
          httpClient: http.Client(),
        ),
      ),
    );
  }

  void _registerControllers() {
    Get.lazyPut<NoticeController>(
      () => NoticeController(
        repository: Get.find<NoticeRepository>(),
      ),
    );
  }
}
