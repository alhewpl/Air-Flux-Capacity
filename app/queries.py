import database as db


def search_flight(airport):
    query = '''SELECT f.origin, f.destination, f.dept_time, f.duration, 
    	addtime(f.dept_time, f.duration) as arrival_time, plane.type as equipment 
    	FROM flights.aircrafts plane 
    	JOIN flights.airports a ON plane.location_id = a.id 
    	JOIN flights.flight_plan f ON a.code = f.origin
        WHERE a.code = %s;'''   
    return db.query_db(query, (airport,))

def operationsplan(registration):
	query = '''SELECT origin, destination, dept_time FROM flights.flight_plan f
            JOIN flights.airports a ON a.code = f.origin
            JOIN flights.aircrafts plane ON plane.location_id = a.id
            WHERE plane.registration_no = %s;'''
	return db.query_db(query, (registration, ))            


