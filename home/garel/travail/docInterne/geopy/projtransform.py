#!/usr/env/python
# -*- coding: utf-8 -*-

import os
import sys
import shutil
import codecs
import pyproj

class mypyproj():
    """
    """
    def __init__(self):
        # projection 1 : Spherical Mercator = EPSG:3857
        self.p1 = Proj(init='epsg:3857')
        # projection 2 : WGS84 = EPSG:4326
        self.p2 = Proj(init='epsg:4326')
        # projection 3 : RGF93 = EPSG:4171
        self.p3 = Proj(init='epsg:4171')
        # projection 4 : Lambert93 = EPSG:2154
        self.p4 = Proj(init='epsg:2154')
        # projection 5 : LambertCC46 = EPSG:3946
        self.p5 = Proj(init='epsg:3946')
        # projection 6 : Lambert2 = EPSG:27562
        self.p6 = Proj(init='epsg:27562')
    def p2Top4(self, x, y):
        # coordonnées du centre de La Rochelle en wgs84
        xini, yini = self.p2(x, y)
        # transformation de ces coordonnées en Lambert 93
        xfin, yfin = transform(self.p2, self.p4, xini, yini)
        # affichage des resultats
        print '%9.3f %11.3f' % (xini, yini)
        print '%9.3f %11.3f' % (xfin, yfin)



def initialise():
    """
    initialisation du script : on prend les bons fihciers de départ
    """
    pass


if __name__ == "__main__":
    initialise()
    # coordonnées du centre de La Rochelle en wgs84
    x=46.160329
    y=-1.151139
    mypyproj = mypyproj()
    mypyproj.p2Top4(x, y)

