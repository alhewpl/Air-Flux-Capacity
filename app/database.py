from flask import g
import mysql.connector
from main import app



def connect():
    conn = mysql.connector.connect(host = '127.0.0.1', 
                user = 'root',
                passwd = 'testing_out', 
                db = 'flights'
                )
    
    return conn


def disconnect_db():
    db = getattr(g, "_database", None)
    if db is not None:
        db.close()


def make_dicts(cursor, row):
    """
    Makes database results to a dictionary.
    """
    return dict((cursor.description[idx][0], value)
                for idx, value in enumerate(row))


def get_db():
    db = getattr(g, "_database", None)
    if db is None:
        db = g._database = connect()
        db.row_factory = make_dicts
    return db


def fetch_all(cur):
    rv = []
    row = cur.fetchone()
    while row is not None:
        rv.append(make_dicts(cur,row))
        row = cur.fetchone()
    if len(rv) == 0:
        return None
    else:
        return rv


def query_db(query, args=(), one=False):
    """
    Args must be sent as a tuple, if you have one argument pass it as (value,)
    """
    db = get_db()
    cur = db.cursor()
    cur.execute(query, args)
    rv = fetch_all(cur)
    cur.close()
    db.commit()
    return (rv[0] if rv else None) if one else rv