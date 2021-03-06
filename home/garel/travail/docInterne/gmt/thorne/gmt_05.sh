#!/bin/csh

# recuperation des fichiers palettes
#wget -nv \
#     -q \
#     -N \
#     http://soliton.vm.bytemark.co.uk/pub/cpt-city/wkp/country/wiki-tunis-gulf.cpt \
#     -O wiki-tunis-gulf.cpt 

makecpt -CColor_DEM.cpt \
        -Z \
        -T800/5000/100 >! gmt_05.cpt

grdimage ~/doc/gmt/homework/HW6_Data/ETOPO1_Ice_g_gmt4.grd \
         -R-116/-108/36/43 \
         -JX5i/6i \
         -B2g10000nSeW \
         -Cgmt_05.cpt \
         -V \
         -P \
         -K >! gmt_05.ps
         
         
pscoast -R \
        -JX5d/6d \
        -Df \
        -V \
        -P \
        -O \
        -K \
        -W2 \
        -N2 \
        -S33/204/255 >> gmt_05.ps

# draw an inset box
psxy -R \
     -JX \
     -W8/255/0/0 \
     -O \
     -P << EOF >> gmt_05.ps
-111.833 40.75
-111.833 40.583
-111.5   40.583
-111.5   40.75
-111.833 40.75
EOF


#gs -sDEVICE=x11 gmt_05.ps
ps2pdf -sPAPERSIZE=a4 gmt_05.ps
evince gmt_05.pdf


