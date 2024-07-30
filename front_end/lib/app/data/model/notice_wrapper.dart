import 'package:pandora_front/app/data/model/notice_model.dart';

class NoticeWrapper {
  final List<NoticeModel> notices;

  NoticeWrapper({required this.notices});

  factory NoticeWrapper.fromJson(Map<String, dynamic> json) {

    List<NoticeModel> noticeList = [];

    if (json.containsKey('resource') && json['resource'] is List) {
      json['resource'].forEach((snapshot) {
        final NoticeModel noticeModel = NoticeModel.fromJson(snapshot);
        noticeList.add(noticeModel);
      });
    }
    return NoticeWrapper(notices: noticeList);
  }
}
