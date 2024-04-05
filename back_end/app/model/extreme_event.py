from app.model.central_measurement import CentralMeasurement
from app.model.location import Location


class ExtremeEvent:
    def __init__(self, data):
        self.code = data.get('code')
        self.code_formatted = data.get('code_formatted')
        self.data_source = data.get('data_source')
        self.description = data.get('description')
        self.description_formatted = data.get('description_formatted')
        self.medium_duration = data.get('medium_duration')
        self.site_greatest_recurrence = data.get('site_greatest_recurrence')
        self.total_location_records = data.get('total_location_records')
        self.total_recurrence = data.get('total_recurrence')
        self.region_greatest_recurrence = data.get('region_greatest_recurrence')
        self.probability_occurrence = data.get('probability_occurrence')
        self.central_measurement_data = CentralMeasurement(data.get('central_measurement_data'))
        self.locations = [Location(loc) for loc in data.get('locations', [])]

    def to_dict(self):
        return {
            "code": self.code,
            "code_formatted": self.code_formatted,
            "data_source": self.data_source,
            "description": self.description,
            "description_formatted": self.description_formatted,
            "medium_duration": self.medium_duration,
            "site_greatest_recurrence": self.site_greatest_recurrence,
            "total_location_records": self.total_location_records,
            "total_recurrence": self.total_recurrence,
            "region_greatest_recurrence": self.region_greatest_recurrence,
            "probability_occurrence": self.probability_occurrence,
            "central_measurement_data": self.central_measurement_data.data,
            "locations": [loc.__dict__ for loc in self.locations]
        }

    @classmethod
    def from_dict(cls, data):
        return cls(data)

