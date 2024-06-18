import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:pandora_front/app/data/repository/position_repository.dart';

class PositionController extends GetxController {
  final PositionRepository positionRepository;

  PositionController({
    required this.positionRepository,
  });

  Future<Position> getLocationData() async {
    return await positionRepository.getPosition();
  }
}
