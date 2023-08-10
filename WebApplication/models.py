from sqlalchemy import Boolean, Column, ForeignKey, Integer, String, DateTime
from sqlalchemy.orm import relationship
from sqlalchemy.sql import func
from database import Base


class Country(Base):
    __tablename__ = "spr_country"

    id_spr_country = Column(Integer, primary_key=True, index=True)
    country_name = Column(String, unique=True, index=True)
    country_iso_code = Column(String, unique=True, index=True)
    created = Column(DateTime, server_default=func.now())
    creator = Column(String, unique=False, index=False)
    is_active = Column(Boolean, default=True)
