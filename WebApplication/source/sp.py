""" stored procedures adapter for fast-api CTS_GEORGAPHY """
from source import schemas
import typing


def sp_api_airports(
    sp_result: typing.List[typing.Set],
) -> typing.List[schemas.Airport]:
    airport_list = []
    for item in sp_result:
        dct = {
            "airport_iata_code": item[0],
            "airport_name_eng": item[1],
            "airport_name_rus": item[2],
            "city_name_eng": item[3],
            "city_name_rus": item[4],
            "country_iso_code": item[5],
            "country_name": item[6],
            "airport_latitude": item[7],
            "airport_longtitude": item[8],
        }
        airport = schemas.Airport(**dct)
        airport_list.append(airport)
    return airport_list
