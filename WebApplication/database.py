from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
from config import *


server = DB_SERVER
database = DB_DATABASE
driver = DB_DRIVER

engine = create_engine(
    f"mssql+pyodbc://{server}/{database}?trusted_connection=yes&driver={driver}",
    echo=True,
)

SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

Base = declarative_base()
