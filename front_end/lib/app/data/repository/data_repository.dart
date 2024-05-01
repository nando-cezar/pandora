import 'package:pandora_front/app/data/model/extreme_event_wrapper.dart';
import 'package:pandora_front/app/data/provider/data_provider.dart';

class DataRepository {
  final dataProvider = DataProvider();

  Future<ExtremeEventWrapper> getGeneralData({latitude, longitude, pastDays, forecastDays}) {
      return dataProvider.getGeneralData(latitude, longitude, pastDays, forecastDays);
  }
}