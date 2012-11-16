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

import mapnik
mapfile = 'tutorial2.xml'
map_output = 'hello_world_using_xml_config.png'

# Instantiate a map object with given width, height and spatial reference system
#m = mapnik.Map(600,300,"+proj=latlong +datum=WGS84")
m = mapnik.Map(600,300)

mapnik.load_map(m, mapfile)
bbox = mapnik.Envelope(mapnik.Coord(-180.0, -90.0), mapnik.Coord(180.0, 90.0))
m.zoom_to_box(bbox) 

# Write the data to a png image called world.png in the base directory of your user
mapnik.render_to_file(m, map_output)


# Exit the python interpreter
exit()

