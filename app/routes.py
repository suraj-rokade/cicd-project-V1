from flask import Blueprint, jsonify # type: ignore

bp = Blueprint("main", __name__)

@bp.route("/", methods=["GET"])
def index():
    return jsonify({"message": "Hello from my-flask-app!"})
