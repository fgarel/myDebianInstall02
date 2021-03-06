#!/bin/csh
#		$Id: job02.csh,v 1.18 2011/03/01 01:34:48 remko Exp $
#		GMT EXAMPLE 02
#
# Purpose:	Make two color images based gridded data
# GMT progs:	gmtset, grd2cpt, grdgradient, grdimage, makecpt, psscale, pstext
# Unix progs:	cat rm

gmtset HEADER_FONT_SIZE 30 OBLIQUE_ANNOTATION 0
makecpt -Crainbow -T-2/14/2 >! g.cpt
grdimage HI_geoid2.nc -R160/20/220/30r -JOc190/25.5/292/69/4.5i -E50 -K -P -B10 -Cg.cpt \
	-U/-1.25i/-1i/"Example 2 in Cookbook" -X1.5i -Y1.25i >! ../example_02.ps
psscale -Cg.cpt -D5.1i/1.35i/2.88i/0.4i -O -K -Ac -B2:GEOID:/:m: -E >> ../example_02.ps
grd2cpt HI_topo2.nc -Crelief -Z >! t.cpt
grdgradient HI_topo2.nc -A0 -Nt -GHI_topo2_int.nc
grdimage HI_topo2.nc -IHI_topo2_int.nc -R -J -E50 -B10:."H@#awaiian@# T@#opo and @#G@#eoid:" \
	-O -K -Ct.cpt -Y4.5i --HEADER_OFFSET=0.5i >> ../example_02.ps
psscale -Ct.cpt -D5.1i/1.35i/2.88i/0.4i -O -K -I0.3 -Ac -B2:TOPO:/:km: >> ../example_02.ps
pstext -R0/8.5/0/11 -Jx1i -O -N -Y-4.5i << END >> ../example_02.ps
-0.4 7.5 30 0.0 1 CB a)
-0.4 3.0 30 0.0 1 CB b)
END

\rm -f HI_topo2_int.nc ?.cpt .gmt*
