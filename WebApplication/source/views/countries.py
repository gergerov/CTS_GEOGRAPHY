from typing import List
from fastapi import Depends, Query, APIRouter
from sqlalchemy.orm import Session
from source.dependencies.db import get_db
from source import crud, schemas


router = APIRouter(prefix="/country", tags=["countries"])


@router.get("/list", response_model=List[schemas.Country])
def list(
    q: str = Query(
        default=None, description="country iso code or country name or country id"
    ),
    page: int = Query(ge=0, default=0),
    size: int = Query(ge=1, le=24, default=10),
    db: Session = Depends(get_db),
):
    countries = crud.get_country(db, q, page, size)
    return countries
