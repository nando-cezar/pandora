from flask import Blueprint
from flask_restful import Api

from .resources import ExtremeEventStatisticalResource

bp = Blueprint("restapi", __name__, url_prefix="/api/v1")
api = Api(bp)


def init_app(app):
    resource_params = {
        "secret_key": app.config.SECRET_KEY,
    }
    api.add_resource(ExtremeEventStatisticalResource, "/extreme-events/statistical", resource_class_kwargs=resource_params)
    #.add_resource(ProductItemResource, "/product/<int:product_id>")
    app.register_blueprint(bp)