from pydantic import BaseModel
from datetime import datetime
import typing

class CountryBase(BaseModel):
    country_name: str
    country_iso_code: str


class Country(CountryBase):
    id_spr_country: int
    is_active: bool

    class Config:
        from_attributes = True


class AirportsBase(BaseModel):
    airport_iata_code: str
    airport_name_eng: str
    airport_name_rus: typing.Optional[str] = None


class Airport(AirportsBase):
    city_name_eng: str
    city_name_rus: typing.Optional[str] = None
    country_iso_code: str
    country_name: str
    airport_latitude: typing.Optional[str] = None
    airport_longtitude: typing.Optional[str]  = None
    
    class Config:
        from_attributes = True
