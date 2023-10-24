from auth import app
from flask import jsonify, redirect
import os
import socket

@app.route('/')
def home():
    return jsonify({"Message":f"This ms db data app container id: {socket.gethostname()}"})

@app.route("/route", methods=["GET"])
def route():
    return redirect(f"http://{os.getenv('ROUTE_TO')}/{os.getenv('DB_DATA_NAME')}", code=302)