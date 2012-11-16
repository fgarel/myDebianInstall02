#!/usr/bin/env python

#
# This file is part of Mapnik (c++ mapping toolkit)
#
# Copyright (C) 2006 Jean-Francois Doyon
#
# Mapnik is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
#

import mapnik2

# Instantiate a map object with given width, height and spatial reference system
m = mapnik2.Map(600,300,"+proj=latlong +datum=WGS84")
# Set background colour to 'steelblue'.  
# You can use 'named' colours, #rrggbb, #rgb or rgb(r%,g%,b%) format
m.background = mapnik2.Color('steelblue')

# Now lets create a style and add it to the Map.
s = mapnik2.Style()
# A Style can have one or more rules. A rule consists of a filter, min/max scale 
# demoninators and 1..N Symbolizers. If you don't specify filter and scale denominators
# you get default values :
#   Filter =  'ALL' filter (meaning symbolizer(s) will be applied to all features) 
#   MinScaleDenominator = 0
#   MaxScaleDenominator = INF  
# Lets keep things simple and use default value, but to create a map we 
# we still must provide at least one Symbolizer. Here we  want to fill countries polygons with 
# greyish colour and draw outlines with a bit darker stroke. 

r=mapnik2.Rule()
r.symbols.append(mapnik2.PolygonSymbolizer(mapnik2.Color('#f2eff9')))
r.symbols.append(mapnik2.LineSymbolizer(mapnik2.Color('rgb(50%,50%,50%)'),0.1))
s.rules.append(r)


# Here we have to add our style to the Map, giving it a name.
m.append_style('My Style',s)

# Here we instantiate our data layer, first by giving it a name and srs (proj4 projections string), and then by giving it a datasource.
lyr = mapnik2.Layer('world',"+proj=latlong +datum=WGS84")
# Then provide the full filesystem path to a shapefile in WGS84 or EPSG 4326 projection without the .shp extension
# A sample shapefile can be downloaded from http://mapnik-utils.googlecode.com/svn/data/world_borders.zip
lyr.datasource = mapnik2.Shapefile(file='/home/garel/geodata/vecteur/world/ne_110m_admin_0_countries.shp')
lyr.styles.append('My Style')


m.layers.append(lyr)
m.zoom_to_box(lyr.envelope())


# Write the data to a png image called world.png in the base directory of your user
mapnik2.render_to_file(m,'/home/garel/geodata/raster/world/world.png', 'png')

# Exit the python interpreter
exit()

