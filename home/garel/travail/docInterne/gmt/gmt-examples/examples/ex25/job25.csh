#!/bin/csh
#		$Id: job25.csh,v 1.11 2011/03/01 01:34:48 remko Exp $
#		GMT EXAMPLE 25
#
# Purpose:	Display distribution of antipode types
# GMT progs:	gmtset, grdlandmask, grdmath, grd2xyz, gmtmath, grdimage, pscoast, pslegend
# Unix progs:	cat

# Create D minutes global grid with -1 over oceans and +1 over land

set D = 30
grdlandmask -Rg -I${D}m -Dc -A500 -N-1/1/1/1/1 -F -Gwetdry.nc

# Manipulate so -1 means ocean/ocean antipode, +1 = land/land, and 0 elsewhere

grdmath wetdry.nc DUP 180 ROTX FLIPUD ADD 2 DIV = key.nc

# Calculate percentage area of each type of antipode match.

grdmath -Rg -I${D}m -F Y COSD 60 $D DIV 360 MUL DUP MUL PI DIV DIV 100 MUL = scale.nc
grdmath key.nc -1 EQ 0 NAN scale.nc MUL = tmp.nc
grd2xyz tmp.nc -S -ZTLf >! key.b
set ocean = `gmtmath -bi1s -Ca -S key.b SUM UPPER RINT =`
grdmath key.nc 1 EQ 0 NAN scale.nc MUL = tmp.nc
grd2xyz tmp.nc -S -ZTLf >! key.b
set land = `gmtmath -bi1s -Ca -S key.b SUM UPPER RINT =`
grdmath key.nc 0 EQ 0 NAN scale.nc MUL = tmp.nc
grd2xyz tmp.nc -S -ZTLf >! key.b
set mixed = `gmtmath -bi1s -Ca -S key.b SUM UPPER RINT =`

# Generate corresponding color table

cat << END >! key.cpt
-1.5	blue	-0.5	blue
-0.5	gray	0.5	gray
0.5	red	1.5	red
END

# Create the final plot and overlay coastlines

gmtset ANNOT_FONT_SIZE_PRIMARY +10p PLOT_DEGREE_FORMAT dddF
grdimage key.nc -Sn -JKs180/9i -B60/30:."Antipodal comparisons":WsNE -K -Ckey.cpt -Y1.2i \
	-U/-0.75i/-0.95i/"Example 25 in Cookbook" >! ../example_25.ps
pscoast -R -J -O -K -Wthinnest -Dc -A500 >> ../example_25.ps

# Place an explanatory legend below

pslegend -R0/9/0/0.5 -Jx1i/-1i -O -Dx4.5/0/6i/0.3i/TC -Y-0.2i -Fthick << END >> ../example_25.ps
N 3
S 0.15i s 0.2i red  0.25p 0.3i Terrestrial Antipodes [$land %]
S 0.15i s 0.2i blue 0.25p 0.3i Oceanic Antipodes [$ocean %]
S 0.15i s 0.2i gray 0.25p 0.3i Mixed Antipodes [$mixed %]
END

\rm -f *.nc key.* .gmt*
