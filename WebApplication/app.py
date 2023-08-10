from typing import List

from fastapi import Depends, FastAPI, HTTPException, Query, Request, Response
from sqlalchemy.orm import Session

import crud, models, schemas
from database import SessionLocal, engine


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


# Dependency
def get_db(request: Request):
    return request.state.db


@app.get('/countries', response_model=List[schemas.Country])
def read_countries(
        q: str = Query(default=None, description='country iso code or country name or country id'), 
        page: int = Query(ge=0, default=0), 
        size: int = Query(ge=1, le=24, default=10), 
        db: Session = Depends(get_db)
    ):
    countries = crud.get_country(db, q, page, size)
    return countries


@app.get('/airports', response_model=List[schemas.Airport], description='airports by iata code or city/airport name')
def read_airports(
        iata_code: str = Query(default='', description='airport iata code'),
        q: str = Query(default='', description='airport name or city name'), 
        page: int = Query(ge=0, default=0), 
        size: int = Query(ge=1, le=24, default=10), 
        db: Session = Depends(get_db)
    ):
    return crud.get_airports(db, iata_code, q, page, size)
