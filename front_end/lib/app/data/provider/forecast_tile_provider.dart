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

  String mapType = '';
  double opacity = 0.0;
  DateTime dateTime = DateTime.now();
  int tileSize = 256;

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
    Uint8List tileBytes = Uint8List(0);
    final date = dateTime.millisecondsSinceEpoch ~/ 1000;
    final String apiUrl =
        '$_mapOpenWeatherUrl/$mapType/$zoom/$x/$y?date=$date&opacity=$opacity&appid=$_mapOpenWeatherKey';

    try {
      var response = await httpClient.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        _logger.i("ForecastTileProvider: Successfully!");
        tileBytes = response.bodyBytes;
      } else {
        _logger.e("Error log", error: response.statusCode);
        throw Exception('error_load_data'.tr);
      }
    } catch (error) {
      _logger.e("Error log", error: error);
      throw Exception('error_load_data'.tr);
    }
    return Tile(tileSize, tileSize, tileBytes);
  }
}
