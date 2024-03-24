import concurrent.futures

import numpy as np
import pandas as pd
from scipy.stats import ttest_rel
import requests

from flask import jsonify
from flask_restful import Resource, reqparse, abort

from app.ext.database import db


class ExtremeEventDataGeneralResource(Resource):

    def __init__(self, secret_key):
        self.secret_key = secret_key
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

        super(ExtremeEventDataGeneralResource, self).__init__()

    def get(self):

        if not self.token == self.secret_key:
            abort(401)

        data = self._get_general_data_history()

        if not data:
            abort(404)

        result = self._intercept_calculation()

        if not result:
            abort(404)

        for i in range(len(data)):
            data[i]["probability_occurrence"] = result[i]

        return jsonify({"content": data})

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
        documents = extreme_event_ref.stream()
        for doc in documents:
            sub_docs = doc.reference.collection("Statistical Correlation Data").stream()
            sub_docs_data = [sub_doc.to_dict() for sub_doc in sub_docs]
            response.extend(sub_docs_data)

        if not response:
            abort(404)

        return response

    def _get_general_data_history(self):

        response = []

        extreme_event_ref = db.source.collection("Extreme Event").document("South America").collection("Brazil")
        for doc in extreme_event_ref.stream():

            data = {
                "code": doc.get('code'),
                "code_formatted": doc.get('code_formatted'),
                "data_source": doc.get('data_source'),
                "description": doc.get('description'),
                "description_formatted": doc.get('description_formatted'),
                "medium_duration": doc.get('medium_duration'),
                "site_greatest_recurrence": doc.get('site_greatest_recurrence'),
                "total_location_records": doc.get('total_location_records'),
                "total_recurrence": doc.get('total_recurrence'),
            }


            for sub_doc in doc.reference.collection("Central Measurement Data").stream():
                data["central_measurement_data"] = sub_doc.to_dict()

            response.append(data)
        if not response:
            abort(404)

        return response