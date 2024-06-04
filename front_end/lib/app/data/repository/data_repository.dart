import 'package:pandora_front/app/data/model/extreme_event_wrapper.dart';
import 'package:pandora_front/app/data/provider/data_provider.dart';

class DataRepository {
  final DataProvider dataProvider;

  DataRepository({required this.dataProvider});

  Future<ExtremeEventWrapper> getGeneralData({latitude, longitude, pastDays, forecastDays}) {
      return dataProvider.getGeneralData(latitude, longitude, pastDays, forecastDays);
  }
}