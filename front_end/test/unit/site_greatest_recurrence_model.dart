import 'package:flutter_test/flutter_test.dart';
import 'package:pandora_front/app/data/model/site_greatest_recurrence_model.dart';

void main() {
  group('SiteGreatestRecurrenceModel', () {
    test('should create an instance with all properties', () {
      final model = SiteGreatestRecurrenceModel(
        address: '123 Street',
        state: 'NY',
        region: 'Northeast',
        subtotalRecords: 42,
      );

      expect(model.address, '123 Street');
      expect(model.state, 'NY');
      expect(model.region, 'Northeast');
      expect(model.subtotalRecords, 42);
    });

    test('should create an instance from JSON', () {
      final json = {
        'address': '123 Street',
        'state': 'NY',
        'region': 'Northeast',
        'subtotalRecords': 42,
      };

      final model = SiteGreatestRecurrenceModel.fromJson(json);

      expect(model.address, '123 Street');
      expect(model.state, 'NY');
      expect(model.region, 'Northeast');
      expect(model.subtotalRecords, 42);
    });

    test('should convert an instance to JSON', () {
      final model = SiteGreatestRecurrenceModel(
        address: '123 Street',
        state: 'NY',
        region: 'Northeast',
        subtotalRecords: 42,
      );

      final json = model.toJson();

      expect(json['address'], '123 Street');
      expect(json['state'], 'NY');
      expect(json['region'], 'Northeast');
      expect(json['subtotalRecords'], 42);
    });

    test('should handle null values correctly', () {
      final model = SiteGreatestRecurrenceModel(
        address: null,
        state: null,
        region: null,
        subtotalRecords: null,
      );

      final json = model.toJson();

      expect(json.containsKey('address'), false);
      expect(json.containsKey('state'), false);
      expect(json.containsKey('region'), false);
      expect(json.containsKey('subtotalRecords'), false);
    });
  });
}