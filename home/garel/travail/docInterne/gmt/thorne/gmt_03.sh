#!/bin/csh

# Generate a color palette table
#makecpt -Ccelsius \
#makecpt -Ccool \
makecpt -Ccelsius \
        -T-5/5/.1 \
        -Z \
        -I >! colors.cpt

# Plot the gridded image
grdimage s20rts.grd \
         -Ccolors.cpt \
         -R120/280/-55/40 \
         -JX6.4i/3.8i \
         -B20g10000f10/10g10000nSeW \
         -P \
         -E300 \
         -K >! gmt_03.ps

# Add the coastline information
pscoast -R \
        -JX6.4id/3.8id \
        -Dc \
        -W1/2/255/255/255 \
        -P \
        -O \
        -K \
        -A10000 \
        -N1/1/255/255/255 >> gmt_03.ps
        
# Add a scale bar of the colors
psscale -D2.0i/4.75i/3.5i/.3ih \
        -O \
        -Ccolors.cpt \
        -B2.5 >> gmt_03.ps

rm colors.cpt

#gs -sDEVICE=x11 gmt_03.ps
ps2pdf gmt_03.ps
evince gmt_03.pdf

