import concurrent.futures

import numpy as np
import pandas as pd
from flask_restful import abort
from scipy.stats import ttest_ind
import requests

from app.core.probability_occurrence import ProbabilityOccurrence
from app.ext.database import db


class StatisticalCorrelation(ProbabilityOccurrence):

    def __init__(self,
                 latitude: float,
                 longitude: float,
                 timezone: str,
                 past_days: int,
                 forecast_days: int,
                 continent: str,
                 country: str):

        self.latitude = latitude
        self.longitude = longitude
        self.timezone = timezone
        self.past_days = past_days
        self.forecast_days = forecast_days
        self.continent = continent
        self.country = country

        super(StatisticalCorrelation, self).__init__()

    def calculate(self):
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
            statistic, p_value = ttest_ind(
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

        if not response:
            abort(404)

        data = response.json().get('daily', [])
        df = pd.DataFrame(data)
        forecast_corr = df.corr().fillna(0)
        return forecast_corr

    def _get_statistical_correlation_historical(self):

        response = []

        extreme_event_ref = db.source.collection("Extreme Event").document(self.continent).collection(self.country)
        documents = extreme_event_ref.stream()
        for doc in documents:
            sub_docs = doc.reference.collection("Statistical Correlation Data").stream()
            sub_docs_data = [sub_doc.to_dict() for sub_doc in sub_docs]
            response.extend(sub_docs_data)

        if not response:
            abort(404)

        return response
