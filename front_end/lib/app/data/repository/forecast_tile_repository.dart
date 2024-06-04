import 'package:pandora_front/app/data/provider/forecast_tile_provider.dart';

class ForecastTileRepository {
  final ForecastTileProvider forecastTileProvider;

  ForecastTileRepository({required this.forecastTileProvider});

  ForecastTileProvider getForecastTileProvider({mapType, opacity, dateTime}) {
    return forecastTileProvider.setData(
      mapType: mapType,
      opacity: opacity,
      dateTime: dateTime,
    );
  }
}
