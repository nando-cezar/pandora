import 'package:geolocator/geolocator.dart';
import 'package:logger/logger.dart';

class PositionProvider {
  final _logger = Logger();

  Future<Position> getPosition() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    _logger.i("PositionProvider: Successfully!");
    return Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }
}
