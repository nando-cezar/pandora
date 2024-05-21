import numpy as np
import pandas as pd
from flask_restful import abort
from scipy.stats import ttest_ind, ttest_rel
import requests

from app.core.probability_occurrence import ProbabilityOccurrence
from app.ext.database import db


class StatisticalCorrelation(ProbabilityOccurrence):

    def calculate(self, **kwargs):
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

        forecast_corr = self._get_statistical_correlation_forecast(**kwargs)
        historical_corr = self._get_statistical_correlation_historical(**kwargs)
        historical_corr_matrices = [
            np.array(
                pd.DataFrame(historical_corr[i])
                .fillna(0)
                .reindex(
                    index=ordered,
                    columns=ordered
                )
            ) for i in range(8)
        ]

        def calculate_similarity(e):
            historical = np.array(e).flatten()
            forecast = np.array(forecast_corr).flatten()

            if np.var(historical) == 0 or np.var(forecast) == 0:
                # Handle case where input arrays have zero variance
                return np.nan, np.nan

            try:
                _, p_value1 = ttest_ind(historical, forecast)
                _, p_value2 = ttest_rel(historical, forecast)
                return p_value1 * 100, p_value2 * 100
            except Exception as e:
                print("Error occurred:", e)
                return np.nan, np.nan

        percentage_similarities = []

        for element in historical_corr_matrices:
            p_value_ind, p_value_rel = calculate_similarity(element)
            percentage_similarities.append({p_value_ind, p_value_rel})

        return percentage_similarities

    @staticmethod
    def _get_statistical_correlation_forecast(**kwargs):

        params = {
            "latitude": kwargs['latitude'],
            "longitude": kwargs['longitude'],
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
            "timezone": kwargs['timezone'],
            "past_days": kwargs['past_days'],
            "forecast_days": kwargs['forecast_days'],
            "models": ["best_match"]
        }

        response = requests.get("https://api.open-meteo.com/v1/forecast", params=params)

        if not response:
            abort(404)

        data = response.json().get('daily', [])
        df = pd.DataFrame(data).drop(['time'], axis=1)
        forecast_corr = df.corr().fillna(0)
        return forecast_corr

    @staticmethod
    def _get_statistical_correlation_historical(**kwargs):

        response = []

        extreme_event_ref = (db.source.collection("Extreme Event")
                             .document(kwargs['continent'])
                             .collection(kwargs['country']))

        documents = extreme_event_ref.stream()
        for doc in documents:
            sub_docs = doc.reference.collection("Statistical Correlation Data").stream()
            sub_docs_data = [sub_doc.to_dict() for sub_doc in sub_docs]
            response.extend(sub_docs_data)

        if not response:
            abort(404)

        return response
