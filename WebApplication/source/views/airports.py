from typing import List
from fastapi import Depends, Query, APIRouter
from sqlalchemy.orm import Session
from source.dependencies.db import get_db
from source import crud, schemas


router = APIRouter(prefix="/airport", tags=["airports"])


@router.get(
    "/list",
    response_model=List[schemas.Airport],
    description="airports by iata code or city/airport name",
)
def list(
    iata_code: str = Query(default="", description="airport iata code"),
    q: str = Query(default="", description="airport name or city name"),
    page: int = Query(ge=0, default=0),
    size: int = Query(ge=1, le=24, default=10),
    db: Session = Depends(get_db),
):
    return crud.get_airports(db, iata_code, q, page, size)
