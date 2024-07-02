import 'package:geolocator/geolocator.dart';
import 'package:logger/logger.dart';

class PositionProvider {
  final _logger = Logger();

  Future<Position> getPosition() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception('Location permission denied.');
        }
      }

      _logger.i("PositionProvider: Successfully obtained location.");
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    } catch (e) {
      _logger.e("PositionProvider Error", error: e);
      throw Exception('Failed to get current location: ${e.toString()}');
    }
  }
}
