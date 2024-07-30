import 'package:pandora_front/app/data/model/notice_wrapper.dart';
import 'package:pandora_front/app/data/provider/notice_provider.dart';

class NoticeRepository {
  final NoticeProvider noticeProvider;

  NoticeRepository({required this.noticeProvider});

  Future<NoticeWrapper> getNotices({search, hl, gl, ceid}) {
      return noticeProvider.getNotices(search, hl, gl, ceid);
  }
}