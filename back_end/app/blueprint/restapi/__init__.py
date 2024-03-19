from flask import Blueprint
from flask_restful import Api

from .resources import ExtremeEventStatisticalResource

bp = Blueprint("restapi", __name__, url_prefix="/api/v1")
api = Api(bp)


def init_app(app):
    api.add_resource(ExtremeEventStatisticalResource, "/extreme-events/statistical")
    #.add_resource(ProductItemResource, "/product/<int:product_id>")
    app.register_blueprint(bp)