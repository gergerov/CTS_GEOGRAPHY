""" main project file for fast-api CTS_GEORGAPHY """
from source.database import engine
from fastapi import FastAPI, Depends, Request, Response
from source.views import countries, airports
from source.dependencies import db
from source import models
from source.database import SessionLocal


models.Base.metadata.create_all(bind=engine)

app = FastAPI()


@app.middleware("http")
async def db_session_middleware(request: Request, call_next):
    response = Response("Internal server error", status_code=500)
    try:
        request.state.db = SessionLocal()
        response = await call_next(request)
    finally:
        request.state.db.close()
    return response


app.include_router(countries.router)
app.include_router(airports.router)
