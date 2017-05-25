#!flask/bin/python
from flask import Flask, jsonify
from flask import abort
from flask import make_response
import sqlite3

app = Flask(__name__)

def get_info_from_db(task_id):
	db_name = '3.db'
	jsonStr = ''
	connection = sqlite3.connect(db_name)
	cursor = connection.cursor()

	results = cursor.execute('select assetName from mytable where assetID=?', (task_id,))
	response = [row[0] for row in results.fetchall()]
	name = response[0].encode("utf-8")

	results = cursor.execute('select assetDate from mytable where assetID=?', (task_id,))
	response = [row[0] for row in results.fetchall()]
	date = response[0].encode("utf-8")

	results = cursor.execute('select assetPlace from mytable where assetID=?', (task_id,))
	response = [row[0] for row in results.fetchall()]
	place = response[0].encode("utf-8")

	results = cursor.execute('select assetPrice from mytable where assetID=?', (task_id,))
	response = [row[0] for row in results.fetchall()]
	price = response[0].encode("utf-8")

	results = cursor.execute('select assetUser from mytable where assetID=?', (task_id,))
	response = [row[0] for row in results.fetchall()]
	user = response[0].encode("utf-8")

        results = cursor.execute('select currentStatus from mytable where assetID=?', (task_id,))
        response = [row[0] for row in results.fetchall()]
        currentStatus = response[0].encode("utf-8")

        results = cursor.execute('select assetStatus from mytable where assetID=?', (task_id,))
        response = [row[0] for row in results.fetchall()]
        assetStatus = response[0].encode("utf-8")

        results = cursor.execute('select manufacturer from mytable where assetID=?', (task_id,))
        response = [row[0] for row in results.fetchall()]
        manufacturer = response[0].encode("utf-8")

        results = cursor.execute('select serialNumber from mytable where assetID=?', (task_id,))
        response = [row[0] for row in results.fetchall()]
        serialNumber = response[0].encode("utf-8")

        results = cursor.execute('select model from mytable where assetID=?', (task_id,))
        response = [row[0] for row in results.fetchall()]
        model = response[0].encode("utf-8")

        results = cursor.execute('select specification from mytable where assetID=?', (task_id,))
        response = [row[0] for row in results.fetchall()]
        specification = response[0].encode("utf-8")

        results = cursor.execute('select department from mytable where assetID=?', (task_id,))
        response = [row[0] for row in results.fetchall()]
        department = response[0].encode("utf-8")

	jsonStr = jsonStr + '{"assetName":"%s","assetDate":"%s","assetPlace":"%s","assetPrice":"%s","assetUser":"%s","currentStatus":"%s","assetStatus":"%s","manufacturer":"%s","serialNumber":"%s","model":"%s","specification":"%s","department":"%s"}'%(name,date,place,price,user,currentStatus,assetStatus,manufacturer,serialNumber,model,specification,department,)
	connection.close()
	return(jsonStr)

def query(task_id):
	print get_info_from_db(task_id)
#	return {}
	return {"assetName":"book","assetDate":"2016-01-01","assetPlace":"desk","assetPrice":"666","assetUser":"me"}

@app.route('/asset/<int:task_id>.json', methods=['GET'])
def get_task(task_id):
    task = eval(get_info_from_db(task_id))
    if len(task) == 0:
        abort(404)
    else:
        return jsonify(task)

@app.errorhandler(404)
def not_found(error):
    return make_response(jsonify({"assetName":"NOT FOUND","assetDate":"NOT FOUND","assetPlace":"NOT FOUND","assetPrice":"NOT FOUND","assetUser":"NOT FOUND"}), 404)

if __name__ == '__main__':
    app.run(host='0.0.0.0')

