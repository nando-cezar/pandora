from flask_restful import fields

class CentralMeasurement(object):
    def __init__(self, mean):
        self.mean = mean

    resource_fields = fields.Nested({
        'mean': fields.Nested({
            'et0_fao_evapotranspiration': fields.Float,
            'wind_gusts_10m_max': fields.Float,
            'snowfall_sum': fields.Float,
            'apparent_temperature_max': fields.Float,
            'rain_sum': fields.Float,
            'apparent_temperature_min': fields.Float,
            'wind_direction_10m_dominant': fields.Float,
            'temperature_2m_max': fields.Float,
            'precipitation_sum': fields.Float,
            'temperature_2m_min': fields.Float,
            'wind_speed_10m_max': fields.Float,
            'shortwave_radiation_sum': fields.Float,
            'precipitation_hours': fields.Float,
        }),
    })