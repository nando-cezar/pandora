import 'package:get/get.dart';
import 'package:pandora_front/app/data/provider/forecast_tile_provider.dart';
import 'package:pandora_front/app/data/repository/forecast_tile_repository.dart';

class ForecastTileController extends GetxController {
  final ForecastTileRepository forecastTileRepository;
  String _label = 'PA0';

  ForecastTileController({
    required this.forecastTileRepository,
  });

  ForecastTileProvider getForecastTileProvider({mapType, opacity, dateTime}) {
    return forecastTileRepository.getForecastTileProvider(
      mapType: mapType,
      opacity: opacity,
      dateTime: dateTime,
    );
  }

  void updateLabel(String newLabel) {
    _label = newLabel;
  }

  String getLabel() => _label;
}
