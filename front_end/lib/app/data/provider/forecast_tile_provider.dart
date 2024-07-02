import 'dart:typed_data';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logger/logger.dart';

class ForecastTileProvider implements TileProvider {
  final String _mapOpenWeatherUrl = dotenv.env['MAP_OPEN_WEATHER_URL']!;
  final String _mapOpenWeatherKey = dotenv.env['MAP_OPEN_WEATHER_KEY']!;
  final http.Client httpClient;
  final _logger = Logger();

  late String mapType;
  late double opacity;
  late DateTime dateTime;
  final int tileSize = 256;

  ForecastTileProvider({
    required this.httpClient,
  });

  ForecastTileProvider setData({
    required String mapType,
    required double opacity,
    required DateTime dateTime,
  }) {
    this.mapType = mapType;
    this.opacity = opacity;
    this.dateTime = dateTime;
    return this;
  }

  @override
  Future<Tile> getTile(int x, int y, int? zoom) async {
    late Uint8List tileBytes;

    final date = dateTime.millisecondsSinceEpoch ~/ 1000;
    final String apiUrl =
        '$_mapOpenWeatherUrl/$mapType/$zoom/$x/$y?date=$date&opacity=$opacity&appid=$_mapOpenWeatherKey';

    try {
      var response = await httpClient.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        _logInfo("Successfully fetched tile from API.");
        tileBytes = response.bodyBytes;
      } else {
        _handleError(response.statusCode);
      }
    } catch (error) {
      _handleError(error.toString());
    }

    return Tile(tileSize, tileSize, tileBytes);
  }

  void _handleError(dynamic error) {
    _logger.e("ForecastTileProvider Error", error: error);
    throw Exception('error_load_data'.tr);
  }

  void _logInfo(String message) {
    _logger.i("ForecastTileProvider: $message");
  }
}
