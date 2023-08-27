""" settings for fast-api CTS_GEORGAPHY """
import os


DB_SERVER = os.environ.get("CTS_GEOGRAPHY_DB_SERVER", "192.168.31.8,41433")
DB_DATABASE = os.environ.get("CTS_GEOGRAPHY_DB_DATABASE", "CTS_GEOGRAPHY")
DB_DRIVER = os.environ.get("CTS_GEOGRAPHY_DB_DRIVER", "ODBC+Driver+17+for+SQL+Server")
DB_UID = os.environ.get("CTS_GEOGRAPHY_DB_UID", 'FAST_API_CTS_GEOGRAPHY')
DB_PWD = os.environ.get("CTS_GEOGRAPHY_DB_PWD", 'HhHh@12345678')

DB_CONNECTION_STRING = f"mssql+pyodbc://{DB_UID}:{DB_PWD}@{DB_SERVER}/{DB_DATABASE}?driver={DB_DRIVER}"
