#!/bin/csh
#		$Id: job17.csh,v 1.12 2011/03/01 01:34:48 remko Exp $
#		GMT EXAMPLE 17
#
# Purpose:	Illustrates clipping of images using coastlines
# GMT progs:	grd2cpt, grdgradient, grdimage, pscoast, pstext
# Unix progs:	rm

# First generate geoid image w/ shading

grd2cpt india_geoid.nc -Crainbow >! geoid.cpt
grdgradient india_geoid.nc -Nt1 -A45 -Gindia_geoid_i.nc
grdimage india_geoid.nc -Iindia_geoid_i.nc -JM6.5i -Cgeoid.cpt -P -K -U"Example 17 in Cookbook" \
	>! ../example_17.ps

# Then use pscoast to initiate clip path for land

pscoast -Rindia_geoid.nc -J -O -K -Dl -Gc >> ../example_17.ps

# Now generate topography image w/shading

echo "-10000 150 10000 150" >! gray.cpt
grdgradient india_topo.nc -Nt1 -A45 -Gindia_topo_i.nc
grdimage india_topo.nc -Iindia_topo_i.nc -J -Cgray.cpt -O -K >> ../example_17.ps

# Finally undo clipping and overlay basemap

pscoast -R -J -O -K -Q -B10f5:."Clipping of Images": >> ../example_17.ps

# Put a color legend on top of the land mask

psscale -D4i/7.6i/4i/0.2ih -Cgeoid.cpt -B5f1/:m: -I -O -K >> ../example_17.ps

# Add a text paragraph

pstext -R -J -O -m -Wwhite,Othinner -D-0.1i/0.1i << END >> ../example_17.ps
> 90 -10 12 0 4 RB 12p 3i j
@_@%5%Example 17.@%%@_  We first plot the color geoid image
for the entire region, followed by a gray-shaded @#etopo5@#
image that is clipped so it is only visible inside the coastlines.
END

# Clean up

\rm -f geoid.cpt gray.cpt *_i.nc .gmt*
