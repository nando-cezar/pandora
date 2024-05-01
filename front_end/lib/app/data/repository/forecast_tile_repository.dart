import 'package:pandora_front/app/data/provider/forecast_tile_provider.dart';

class ForecastTileRepository {

  ForecastTileProvider getForecastTileProvider({mapType, opacity, dateTime}) {
      return ForecastTileProvider(mapType: mapType, opacity: opacity, dateTime: dateTime);
  }
}