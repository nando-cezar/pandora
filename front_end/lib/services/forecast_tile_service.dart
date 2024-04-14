import 'dart:typed_data';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ForecastTileProvider implements TileProvider {
  final String mapType;
  final double opacity;
  final DateTime dateTime;
  int tileSize = 256;

  ForecastTileProvider({
    required this.mapType,
    required this.opacity,
    required this.dateTime,
  });

  @override
  Future<Tile> getTile(int x, int y, int? zoom) async {
    Uint8List tileBytes = Uint8List(0);
    final date = dateTime.millisecondsSinceEpoch ~/ 1000;
    final String mapOpenWeatherUrl = dotenv.env['MAP_OPEN_WEATHER_URL']!;
    final String mapOpenWeatherKey = dotenv.env['MAP_OPEN_WEATHER_KEY']!;
    try {
      final String apiUrl =
          '$mapOpenWeatherUrl/$mapType/$zoom/$x/$y?date=$date&opacity=$opacity&appid=$mapOpenWeatherKey';

      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        tileBytes = response.bodyBytes;
      } else {
        throw Exception('Failed to load tile: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load tile: $e');
    }
    return Tile(tileSize, tileSize, tileBytes);
  }
}