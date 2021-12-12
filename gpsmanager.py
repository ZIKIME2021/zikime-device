from PySide2.QtCore import *
from typing import Generator, List

import gpxpy
import gpxpy.gpx

class GPSParser:
    def __init__(self, gpx_file = "gpx_route.gpx"):
        self.__positions : List[tuple] = []

        gpx_file = open(gpx_file, 'r')
        gpx = gpxpy.parse(gpx_file)

        for track in gpx.tracks:
            for segment in track.segments:
                for point in segment.points:
                    self.__positions.append((point.latitude, point.longitude))
        
    def get_current_gps_generator(self):
        for pos in self.__positions:
            yield pos

class GPSManager(QObject):
    __gps_parser: GPSParser = GPSParser()
    __gps_gen: Generator = __gps_parser.get_current_gps_generator()
    __latitude: float
    __longitude: float
    
    @Signal
    def latitudeChanged(self):
        pass
    
    @Slot(float)
    def set_latitude(self, latitude):
        self.__latitude = latitude
        self.latitudeChanged.emit()
    
    def get_latitude(self):
        return self.__latitude
    
    @Signal
    def longitudeChanged(self):
        pass
    
    @Slot(float)
    def set_longitude(self, longitude):
        self.__longitude = longitude
        self.longitudeChanged.emit()
    
    def get_longitude(self):
        return self.__longitude
    
    @Slot()
    def update_gps(self):
        current_gps = next(self.__gps_gen)
        self.set_latitude(current_gps[0])
        self.set_longitude(current_gps[1])
    
    latitude = Property(float, get_latitude, set_latitude, notify=latitudeChanged)
    longitude = Property(float, get_longitude, set_longitude, notify=longitudeChanged)