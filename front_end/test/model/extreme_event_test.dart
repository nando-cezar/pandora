import 'package:flutter_test/flutter_test.dart';
import 'package:pandora_front/app/data/model/extreme_event_model.dart';

void main() {
  group('ExtremeEventModel', () {
    test('should create an instance with all properties', () {
      final model = ExtremeEventModel(
        code: 1,
        codeFormatted: '001',
        description: 'Description',
        descriptionFormatted: 'Formatted Description',
        dataSource: ['source1', 'source2'],
        locations: [],
        siteGreatestRecurrences: [],
        regionGreatestRecurrences: [],
        mediumDuration: 12.5,
        probabilityOccurrence: [0.5, 0.75],
        totalLocationRecords: 10,
        totalRecurrence: 5,
      );

      expect(model.code, 1);
      expect(model.codeFormatted, '001');
      expect(model.description, 'Description');
      expect(model.descriptionFormatted, 'Formatted Description');
      expect(model.dataSource, ['source1', 'source2']);
      expect(model.locations, []);
      expect(model.siteGreatestRecurrences, []);
      expect(model.regionGreatestRecurrences, []);
      expect(model.mediumDuration, 12.5);
      expect(model.probabilityOccurrence, [0.5, 0.75]);
      expect(model.totalLocationRecords, 10);
      expect(model.totalRecurrence, 5);
    });

    test('should create an instance from JSON', () {
      final json = {
        'code': 1,
        'code_formatted': '001',
        'description': 'Description',
        'description_formatted': 'Formatted Description',
        'data_source': ['source1', 'source2'],
        'locations': [],
        'site_greatest_recurrences': [],
        'region_greatest_recurrences': [],
        'medium_duration': 12.5,
        'probability_occurrence': [0.5, 0.75],
        'total_location_records': 10,
        'total_recurrence': 5,
      };

      final model = ExtremeEventModel.fromJson(json);

      expect(model.code, 1);
      expect(model.codeFormatted, '001');
      expect(model.description, 'Description');
      expect(model.descriptionFormatted, 'Formatted Description');
      expect(model.dataSource, ['source1', 'source2']);
      expect(model.locations, isEmpty);
      expect(model.siteGreatestRecurrences, isEmpty);
      expect(model.regionGreatestRecurrences, isEmpty);
      expect(model.mediumDuration, 12.5);
      expect(model.probabilityOccurrence, [0.5, 0.75]);
      expect(model.totalLocationRecords, 10);
      expect(model.totalRecurrence, 5);
    });

    test('should convert an instance to JSON', () {
      final model = ExtremeEventModel(
        code: 1,
        codeFormatted: '001',
        description: 'Description',
        descriptionFormatted: 'Formatted Description',
        dataSource: ['source1', 'source2'],
        locations: [],
        siteGreatestRecurrences: [],
        regionGreatestRecurrences: [],
        mediumDuration: 12.5,
        probabilityOccurrence: [0.5, 0.75],
        totalLocationRecords: 10,
        totalRecurrence: 5,
      );

      final json = model.toJson();

      expect(json['code'], 1);
      expect(json['codeFormatted'], '001');
      expect(json['description'], 'Description');
      expect(json['descriptionFormatted'], 'Formatted Description');
      expect(json['dataSource'], ['source1', 'source2']);
      expect(json['locations'], []);
      expect(json['siteGreatestRecurrences'], []);
      expect(json['regionGreatestRecurrences'], []);
      expect(json['mediumDuration'], 12.5);
      expect(json['probabilityOccurrence'], [0.5, 0.75]);
      expect(json['totalLocationRecords'], 10);
      expect(json['totalRecurrence'], 5);
    });
  });
}