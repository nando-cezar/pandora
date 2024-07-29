from flask import Blueprint
from flask_restful import Api

from app.blueprint.restapi.resource.extreme_event_resource import ExtremeEventResource
from app.blueprint.restapi.resource.notice_resource import NoticeResource
from app.core.impl.scraping_notice import ScrapingNotice
from app.core.impl.statistical_correlation import StatisticalCorrelation

bp = Blueprint("restapi", __name__, url_prefix="/api/v1")
api = Api(bp)


def init_app(app):
    data_general_params = {"secret_key": app.config.SECRET_KEY, "probability": StatisticalCorrelation()}
    api.add_resource(ExtremeEventResource, "/extreme-events/data-general", resource_class_kwargs=data_general_params)

    notice_params = {"secret_key": app.config.SECRET_KEY, "scraping_notice": ScrapingNotice()}
    api.add_resource(NoticeResource, "/extreme-events/notice", resource_class_kwargs=notice_params)

    app.register_blueprint(bp)
