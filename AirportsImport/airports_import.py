import csv
import pyodbc
from airports_import_config import *


connection_string = f"Driver={DB_DRIVER};Server={DB_SERVER};Database={DB_NAME};Trusted_Connection={TRUSTED_CONNECTION};"
_connection = pyodbc.connect(connection_string, timeout=10, autocommit=True)

with open(CSV_FILEPATH, newline='') as f:
    rcsv = csv.reader(f, delimiter='|')
    for i in rcsv:
        
        aic = i[CSV_COLUMN_AIRPORT_IATA_CODE]
        anr = i[CSV_COLUMN_AIRPORT_NAME_RUS]
        ane = i[CSV_COLUMN_AIRPORT_NAME_ENG]
        alt = i[CSV_COLUMN_AIRPORT_LATITUDE]
        alg = i[CSV_COLUMN_AIRPORT_LONGITUDE]
        cnr = i[CSV_COLUMN_CITY_NAME_RUS]
        cne = i[CSV_COLUMN_CITY_NAME_ENG]
        conr = i[CSV_COLUMN_COUNTRY_NAME_RUS]
        ciso = i[CSV_COLUMN_COUNTRY_ISO]
        
        aic = '"' + aic + '"'
        ane = '"' + ane + '"'
        alt = '"' + alt + '"'
        alg = '"' + alg + '"'
        cne = '"' + cne + '"'
        ciso = '"' + ciso + '"'

        if len(anr) > 0: anr = '"' + anr + '"' 
        else: anr = 'null'

        if len(cnr) > 0: cnr = '"' + cnr + '"' 
        else: cnr = 'null'

        if len(conr) > 0: conr = '"' + conr + '"'
        else: conr = 'null' 

        sql = f'exec [{DB_NAME}].[dbo].[ext#airport_import] ' +\
              f'{aic},' + f'{anr},' + f'{ane},' + f'{alt},' +\
              f'{alg},' + f'{cnr},' + f'{cne},' + f'{conr},' +\
              f'{ciso}'


        if aic != '"0"':
            print(aic)
            _connection.execute(sql)