import 'package:flutter_test/flutter_test.dart';
import 'package:pandora_front/app/data/model/region_greatest_recurrence_model.dart';

void main() {
  group('RegionGreatestRecurrenceModel', () {
    test('should create an instance with all properties', () {
      final model = RegionGreatestRecurrenceModel(
        region: 'Northeast',
        recurrence: 15,
      );

      expect(model.region, 'Northeast');
      expect(model.recurrence, 15);
    });

    test('should create an instance from JSON', () {
      final json = {
        'region': 'Northeast',
        'recurrence': 15,
      };

      final model = RegionGreatestRecurrenceModel.fromJson(json);

      expect(model.region, 'Northeast');
      expect(model.recurrence, 15);
    });

    test('should convert an instance to JSON', () {
      final model = RegionGreatestRecurrenceModel(
        region: 'Northeast',
        recurrence: 15,
      );

      final json = model.toJson();

      expect(json['region'], 'Northeast');
      expect(json['recurrence'], 15);
    });

    test('should handle null values correctly', () {
      final model = RegionGreatestRecurrenceModel(
        region: null,
        recurrence: null,
      );

      final json = model.toJson();

      expect(json.containsKey('region'), false);
      expect(json.containsKey('recurrence'), false);
    });
  });
}