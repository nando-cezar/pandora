from flask_restful import fields


class Notice(object):
    def __init__(self, resource):
        self.resource = resource

    resource_fields = {
        'uri': fields.Url('restapi.noticeresource', absolute=True),
        'https_uri': fields.Url('restapi.noticeresource', absolute=True, scheme='https'),
        'resource': fields.List(
            fields.Nested({
                'id': fields.String,
                'url': fields.String,
                'title': fields.String,
                'image': fields.String,
                'date': fields.String,
            }))
    }
