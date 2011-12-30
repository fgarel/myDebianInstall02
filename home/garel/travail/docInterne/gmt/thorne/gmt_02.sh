#!/bin/csh
#---------------------------------------------------------------#
# First we will create a data set to gmt_02
#
# Here we are going to create a wave packet example.
# This is just a combination of two sinusoids with a 100
# and 20 sec period
# i.e., angular frequency = 2*pi/ T
#---------------------------------------------------------------#
@ time = 0
while ($time <= 1000)
  if ($time == 0) then
    echo $time >! temp.xy
  else
    echo $time >> temp.xy
  endif
  @ time = $time + 1
end

# now let's calculate some amplitude values
awk '{print $1, (5*sin(-$1*.063) + 2.5*sin(-$1*.314))}' temp.xy >! timeseries.xy
rm temp.xy

# gmt_02 the time series
psxy timeseries.xy \
     -JX6i/3i \
     -R0/1000/-10/10 \
     -W2/0/0/255 \
     -P \
     -B100g10000f10/5g10000nSeW \
     -X1.5 \
     -Y6.0 \
     -K >! gmt_02.ps

# add some text describing the gmt_02 and axes
pstext -R0/8/0/11 \
       -JX8i/11i \
       -P \
       -O \
       -N << END >> gmt_02.ps
0.0 3.25 16 0 1 1 Wave Packets
2.6 -0.6 12 0 1 1 Time (sec)
-0.5 1.1 12 90 1 1 Amplitude
END

#gs -sDEVICE=x11 gmt_02.ps
ps2pdf gmt_02.ps
evince gmt_02.pdf

