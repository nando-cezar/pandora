from flask_restful import abort


def abort_if_unauthorized(verify):
    if verify:
        abort(401)


def abort_if_not_exists(data):
    if not data:
        abort(404)
