import 'package:pandora_front/app/data/model/extreme_event_model.dart';

class ExtremeEventWrapper {
  final List<ExtremeEventModel> events;

  ExtremeEventWrapper({required this.events});

  factory ExtremeEventWrapper.fromJson(Map<String, dynamic> json) {

    List<ExtremeEventModel> eventList = [];

    if (json.containsKey('resource') && json['resource'] is List) {
      json['resource'].forEach((snapshot) {
        final ExtremeEventModel extremeEventModel = ExtremeEventModel.fromJson(snapshot);
        eventList.add(extremeEventModel);
      });
    }
    return ExtremeEventWrapper(events: eventList);
  }
}
