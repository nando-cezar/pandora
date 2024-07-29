from flask_restful import Resource, reqparse, marshal_with

from app.blueprint.restapi.exception.exception import abort_if_unauthorized, abort_if_not_exists
from app.core.impl.scraping_notice import ScrapingNotice
from app.model.notice import Notice


class NoticeResource(Resource):

    def __init__(self, secret_key: str, scraping_notice: ScrapingNotice):
        self.secret_key = secret_key
        self.scraping_notice = scraping_notice
        self.parser = reqparse.RequestParser(bundle_errors=True)
        self.parser.add_argument('Search', type=str, required=True,
                                 help='Search not given', location='args')
        self.parser.add_argument('Token', type=str, required=True,
                                 help='Token is mandatory', location='args')
        self.parser.add_argument('HL', type=str, required=True,
                                 help='HL is mandatory', location='args')
        self.parser.add_argument('GL', type=str, required=True,
                                 help='GL is mandatory', location='args')
        self.parser.add_argument('CEID', type=str, required=True,
                                 help='CEID is mandatory', location='args')
        args = self.parser.parse_args()

        self.search = args['Search']
        self.token = args['Token']
        self.hl = args['HL']
        self.gl = args['GL']
        self.ceid = args['CEID']

        super(NoticeResource, self).__init__()

    @marshal_with(fields=Notice.resource_fields)
    def get(self):
        abort_if_unauthorized(self.token != self.secret_key)

        data = self._get_notice()

        abort_if_not_exists(data)

        return data

    def _get_notice(self):

        response = (
            self.scraping_notice
            .execute(
                search=self.search,
                hl=self.hl,
                gl=self.gl,
                ceid=self.ceid
            )
        )

        abort_if_not_exists(response)

        return Notice(response).__dict__
