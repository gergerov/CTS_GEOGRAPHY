""" database connection for fast-api CTS_GEORGAPHY """
from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
from source.config import DB_CONNECTION_STRING


engine = create_engine(
    DB_CONNECTION_STRING,
    echo=True,
)

SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

Base = declarative_base()
