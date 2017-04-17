#!flask/bin/python
from flask import Flask, jsonify
from flask import abort
from flask import make_response

app = Flask(__name__)

def query(task_id):
    return {}
    return {"assetName":"book","assetDate":"2016-01-01","assetPlace":"desk","assetPrice":"66    6","    assetUser":"me"}

@app.route('/asset/<int:task_id>', methods=['GET'])
def get_task(task_id):
    task = query(task_id)
    if len(task) == 0:
        abort(404)
    else:
        return jsonify(task)

@app.errorhandler(404)
def not_found(error):
    return make_response(jsonify({"assetName":"NOT FOUND","assetDate":"NOT FOUND","assetPlace":"NOT FOUND","assetPrice":"NOT FOUND","assetUser":"NOT FOUND"}), 404)

if __name__ == '__main__':
    app.run(host='0.0.0.0')

