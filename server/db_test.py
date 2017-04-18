#!flask/bin/python
import sqlite3

db_name = 'list.db'

def get_info_from_db():
	jsonStr = 'the name : '
	connection = sqlite3.connect(db_name)
	cursor = connection.cursor()

	results = cursor.execute("""select assetName from mytable where id = 101""")
	response = [row[0] for row in results.fetchall()]
	name = response[0].encode("utf-8")
	jsonStr = jsonStr + name
	print jsonStr

	results = cursor.execute("""select assetDate from mytable where id = 101""")
	response = [row[0] for row in results.fetchall()]
	date = response[0].encode("utf-8")
	jsonStr = jsonStr + date
	print jsonStr

	connection.close()
	return()

get_info_from_db()
