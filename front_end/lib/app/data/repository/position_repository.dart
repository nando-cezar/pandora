import 'package:geolocator/geolocator.dart';
import 'package:pandora_front/app/data/provider/position_provider.dart';

class PositionRepository {
  final positionProvider = PositionProvider();

  Future<Position> getPosition() {
      return positionProvider.getPosition();
  }
}