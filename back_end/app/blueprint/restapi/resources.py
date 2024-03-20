import concurrent.futures

import numpy as np
import pandas as pd
from scipy.stats import ttest_rel
import requests

from flask import jsonify
from flask_restful import Resource, reqparse, abort

from app.ext.database import db


class ExtremeEventStatisticalResource(Resource):

    def __init__(self):
        self.reqparse = reqparse.RequestParser(bundle_errors=True)
        self.reqparse.add_argument('Token', type=str, required=True,
                                   help='Token is mandatory', location='args')
        self.reqparse.add_argument('Latitude', type=float, required=True,
                                   help='Latitude not given', location='args')
        self.reqparse.add_argument('Longitude', type=float, required=True,
                                   help='Longitude not given', location='args')
        self.reqparse.add_argument('Timezone', type=str, required=True,
                                   help='Timezone not given', location='args')
        self.reqparse.add_argument('PastDays', type=int, required=True,
                                   help='Past days not given', location='args')
        self.reqparse.add_argument('ForecastDays', type=int, required=True,
                                   help='Forecast days not given', location='args')
        args = self.reqparse.parse_args()

        self.token = args['Token']
        self.latitude = args['Latitude']
        self.longitude = args['Longitude']
        self.timezone = args['Timezone']
        self.past_days = args['PastDays']
        self.forecast_days = args['ForecastDays']

        super(ExtremeEventStatisticalResource, self).__init__()

    def get(self):

        if not self.token == "5d2c5c09e23ad9f7dc0600259554cee595256644":
            abort(401)

        result = self._intercept_calculation()

        if not result:
            abort(404)

        df = pd.DataFrame(result)
        return jsonify({"content": df.to_dict()[0]})

    def _intercept_calculation(self):
        ordered = [
            'temperature_2m_max',
            'temperature_2m_min',
            'apparent_temperature_max',
            'apparent_temperature_min',
            'precipitation_sum',
            'rain_sum',
            'snowfall_sum',
            'precipitation_hours',
            'wind_speed_10m_max',
            'wind_gusts_10m_max',
            'wind_direction_10m_dominant',
            'shortwave_radiation_sum',
            'et0_fao_evapotranspiration',
        ]

        forecast_corr = self._get_statistical_correlation_forecast()
        historical_corr = self._get_statistical_correlation_historical()
        historical_corr_matrices = [
            np.array(
                pd.DataFrame(historical_corr[i])
                .fillna(0)
                .reindex(
                    index=ordered,
                    columns=ordered
                )
            ) for i in range(7)
        ]

        def calculate_similarity(element):
            statistic, p_value = ttest_rel(
                np.array(element).flatten(),
                np.array(forecast_corr).flatten()
            )
            return p_value * 100

        with concurrent.futures.ThreadPoolExecutor(max_workers=2) as executor:
            percentage_similarities = list(executor.map(calculate_similarity, historical_corr_matrices))

        return percentage_similarities

    def _get_statistical_correlation_forecast(self):

        params = {
            "latitude": self.latitude,
            "longitude": self.longitude,
            "daily": [
                "temperature_2m_max",
                "temperature_2m_min",
                "apparent_temperature_max",
                "apparent_temperature_min",
                "precipitation_sum",
                "rain_sum",
                "snowfall_sum",
                "precipitation_hours",
                "wind_speed_10m_max",
                "wind_gusts_10m_max",
                "wind_direction_10m_dominant",
                "shortwave_radiation_sum",
                "et0_fao_evapotranspiration"
            ],
            "timezone": self.timezone,
            "past_days": self.past_days,
            "forecast_days": self.forecast_days,
            "models": ["best_match"]
        }

        response = requests.get("https://api.open-meteo.com/v1/forecast", params=params)
        data = response.json().get('daily', [])
        df = pd.DataFrame(data)
        forecast_corr = df.corr().fillna(0)
        return forecast_corr

    def _get_statistical_correlation_historical(self):
        response = []

        extreme_event_ref = db.source.collection("Extreme Event").document("South America").collection("Brazil")
        for doc in extreme_event_ref.stream():
            for sub_doc in doc.reference.collection("Statistical Correlation Data").stream():
                response.append(sub_doc.to_dict())

        if not response:
            abort(404)

        return response
