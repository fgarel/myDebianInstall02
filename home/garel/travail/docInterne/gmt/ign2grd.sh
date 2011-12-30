#/bin/sh

BASENAME=`basename $1 .asc`
ps=example_15.ps

rm -f $BASENAME.txt
rm -f $BASENAME.z
rm -f $BASENAME.grd
rm -f $BASENAME.nc

# conversion
# -Hi6 : le fichier en entré à 6 lignes d'entete
# -V   : mode verbeux
GMT gmtconvert $1 -V -Hi6 > $BASENAME.txt

# 
head -n6 $1

GMT gmtconvert $1 -V -Hi6 | sed -e 's/\t/\n/g' > $BASENAME.z

GMT xyz2grd $BASENAME.z -V -Z -I1 -R379000/379999/6571000/6571999 -G$BASENAME.nc

GMT grdinfo $BASENAME.nc

#region=`GMT minmax $BASENAME.grd -I1`
#GMT nearneighbor $region -I10m -S40k -G$BASENAME.nc $BASENAME.grd
info=`GMT grdinfo -C -M $BASENAME.nc`
GMT grdcontour $BASENAME.nc -JM3i -P -B2WSne -C250 -A1000 -G2i -K -U"Example 15 in Cookbook" > $ps

