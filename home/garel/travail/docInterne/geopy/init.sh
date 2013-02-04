#!/bin/sh
cut -f 1-4 -d';' data_ini.csv | sed -r -e '=' -e 's/;/ /g' -e 's/^ +//g' | sed -r -e 'N;s/\n/;;;;/g' -e 's/$/;;;/g'
