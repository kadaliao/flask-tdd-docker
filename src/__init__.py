# src/__init__.py

import os
import sys

from flask import Flask

from flask_restx import Api, Resource

app = Flask(__name__)
api = Api(app)

app_settings = os.getenv("APP_SETTINGS")
app.config.from_object(app_settings)


print(app.config, file=sys.stderr)


class Ping(Resource):
    def get(self):
        return {"status": "success", "message": "pong!"}


api.add_resource(Ping, "/ping")
