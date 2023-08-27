""" settings for fast-api CTS_GEORGAPHY """
DB_SERVER = "DESKTOP-5G1RJA4\SQLEXPRESS"
DB_DATABASE = "CTS_GEOGRAPHY"
DB_DRIVER = "ODBC+Driver+17+for+SQL+Server"


DB_CONNECTION_STRING =  f"mssql+pyodbc://{DB_SERVER}/{DB_DATABASE}?trusted_connection=yes&driver={DB_DRIVER}"