from flask import Flask
import json
import queries as queries


app = Flask(__name__)




@app.route("/flightplan/<airport>")
def flight_plan(airport):
	json_dict = json.dumps({'results': queries.search_flight(airport)}, default=str)
	return json_dict
    

@app.route("/operationsplan/<registration>")
def flight_details(registration):
    return json.dumps({'Operations-plan': queries.operationsplan(registration)}, default=str)    


@app.errorhandler(404)
def not_found(e):
    return '', 404

if __name__ == "__main__":
    app.run()