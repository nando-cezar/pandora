import 'package:get/get.dart';
import 'package:pandora_front/app/data/repository/local_data_repository.dart';

class LocalDataController extends GetxController {

  final LocalDataRepository localDataRepository;

  LocalDataController({
    required this.localDataRepository,
  });

  updateLatitude(double value) => localDataRepository.saveDouble('latitude', value);

  updateLongitude(double value) => localDataRepository.saveDouble('longitude', value);

  updatePastDays(int value) => localDataRepository.saveInt('pastDays', value);

  updateForecastDays(int value) => localDataRepository.saveInt('forecastDays', value);

  updateRegion(String value) => localDataRepository.saveString('region', value);

  updateExtremeEvent(String value) => localDataRepository.saveString('extremeEvent', value);

  double getLatitude() => localDataRepository.getDouble('latitude');

  double getLongitude() => localDataRepository.getDouble('longitude');

  int getPastDays() => localDataRepository.getInt('pastDays');

  int getForecastDays() => localDataRepository.getInt('forecastDays');

  String getRegion() => localDataRepository.getString('region');

  String getExtremeEvent() => localDataRepository.getString('extremeEvent');
}
