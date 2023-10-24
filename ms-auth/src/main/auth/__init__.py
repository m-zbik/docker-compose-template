from flask import Flask
from flask_cors import CORS

app = Flask(__name__)

CORS(app)
resources = {r"/api/*": {"origins": "*"}}
app.config["CORS_HEADERS"] = "Content-Type"
app.config['JSON_SORT_KEYS'] = False

from auth import routes