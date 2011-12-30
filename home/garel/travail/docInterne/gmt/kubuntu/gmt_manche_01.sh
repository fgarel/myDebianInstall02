#!/bin/csh

# recuperation des fichiers palettes
#wget -nv \
#     -q \
#     -N \
#     http://soliton.vm.bytemark.co.uk/pub/cpt-city/wkp/country/wiki-tunis-gulf.cpt \
#     -O wiki-tunis-gulf.cpt 

        
         
pscoast -R-7/2/47.5/51.5 \
        -JM10c \
        -P \
        -Ggreen \
        -Sblue \
        -W \
        -Di \
        -Ir \
        -B1g1 >! gmt_manche_01.ps


#gs -sDEVICE=x11 gmt_manche_01.ps
#ps2pdf -sPAPERSIZE=a4 gmt_manche_01.ps
#evince gmt_manche_01.pdf

ps2raster -A \
          -Tg \
          gmt_manche_01.ps
          
display gmt_manche_01.png
