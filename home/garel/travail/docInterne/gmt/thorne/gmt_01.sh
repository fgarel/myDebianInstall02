#!/bin/csh
# Example of a simple location map
pscoast -R0/360/-90/90 \
        -JG-1/43/6.5i \
        -Bg30 \
        -Dc \
        -A8000 \
        -G10/10/10 \
        -W3/10/10/10 \
        -P \
        -K >! gmt_01.ps
psxy -R \
     -JG \
     -W6/255/0/0 \
     -P \
     -O \
     -Am << END >> gmt_01.ps
-0.59 45.59
-0.59 46.59
-1.59 46.59
-1.59 45.59
-0.59 45.59
END

#gs -sDEVICE=x11 gmt_01.ps
ps2pdf gmt_01.ps
evince gmt_01.pdf
