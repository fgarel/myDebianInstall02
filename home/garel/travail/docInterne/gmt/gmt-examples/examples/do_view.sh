#!/bin/sh
#
#	$Id: do_view.sh,v 1.4 2008/04/04 17:33:55 remko Exp $
#
#	Simple driver to view all examples using ghostview
#
#viewer=${1:-gv}
viewer=${1:-evince}
#for f in ex??/example_*.ps
for f in example_*.ps
do
    BASENAME=`basename $f .ps`
    ps2pdf $f
	#$viewer $f
	$viewer $BASENAME.pdf
	#echo $BASENAME.pdf
done
