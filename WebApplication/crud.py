from sqlalchemy.orm import Session
from sqlalchemy import or_, text, String
import models, schemas, resultsets


def get_country(db: Session, q: str, page: int, size: int):
    """Return country list by iso_codeor name (rus)"""
    return db.query(models.Country).filter(
        or_(
            models.Country.country_iso_code.like('%'+str(q)+'%'), 
            models.Country.country_name.like('%'+str(q)+'%'),
            models.Country.id_spr_country.cast(String) == q,
            q is None
        )
    ).order_by(models.Country.country_iso_code).offset(page * size).limit((page + 1) * size)


def get_airports(db: Session, iata_code: str, q: str, page: int, size: int):
    return resultsets.airports_resultset(
        db.execute(
            text('exec dbo.api#airports :point_code, :point_name, :page, :size'),
            params={'point_code': iata_code, 'point_name': q, 'page': page, 'size': size}
        )
    )