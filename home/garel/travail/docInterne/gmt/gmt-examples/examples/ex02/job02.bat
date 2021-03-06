REM		GMT EXAMPLE 02
REM
REM		$Id: job02.bat,v 1.13 2011/03/01 01:34:48 remko Exp $
REM
REM Purpose:	Make two color images based gridded data
REM GMT progs:	gmtset, grd2cpt, grdgradient, grdimage, makecpt, psscale, pstext
REM DOS calls:	del, echo
REM
echo GMT EXAMPLE 02
set master=y
if exist job02.bat set master=n
if %master%==y cd ex02
gmtset HEADER_FONT_SIZE 30 OBLIQUE_ANNOTATION 0
makecpt -Crainbow -T-2/14/2 > g.cpt
grdimage HI_geoid2.nc -R160/20/220/30r -JOc190/25.5/292/69/4.5i -E50 -K -P -U/-1.25i/-1i/"Example 2 in Cookbook" -B10 -Cg.cpt -X1.5i -Y1.25i > ..\example_02.ps
psscale -Cg.cpt -D5.1i/1.35i/2.88i/0.4i -O -K -Ac -B2:GEOID:/:m: -E >> ..\example_02.ps
grd2cpt HI_topo2.nc -Crelief -Z > t.cpt
grdgradient HI_topo2.nc -A0 -Nt -GHI_topo2_int.nc
grdimage HI_topo2.nc -IHI_topo2_int.nc -R -J -E50 -B10:."H@#awaiian@# T@#opo and @#G@#eoid:" -O -K -Ct.cpt -Y4.5i --HEADER_OFFSET=0.5i >> ..\example_02.ps
psscale -Ct.cpt -D5.1i/1.35i/2.88i/0.4i -O -K -I0.3 -Ac -B2:TOPO:/:km: >> ..\example_02.ps
echo -0.4 7.5 30 0.0 1 2 a) > tmp
echo -0.4 3.0 30 0.0 1 2 b) >> tmp
pstext tmp -R0/8.5/0/11 -Jx1i -O -N -Y-4.5i >> ..\example_02.ps
del .gmt*
del HI_topo2_int.nc
del ?.cpt
del tmp
if %master%==y cd ..
