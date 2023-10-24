from auth import app
from flask import jsonify, redirect
import os
import socket

@app.route('/')
def home():
    return jsonify({"Message":f"This auth app container id: {socket.gethostname()}"})

@app.route("/route", methods=["GET"])
def route():
    return redirect(f"http://{os.getenv('ROUTE_TO')}/{os.getenv('UI_NAME')}", code=302)