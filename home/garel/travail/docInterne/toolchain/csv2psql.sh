!#/bin/sh

psql -h localhost -U contrib -d dbmapnik -f droptable.sql
psql -h localhost -U contrib -d dbmapnik -f import.sql
psql -h localhost -U contrib -d dbmapnik -f addgeometrycolumn.sql
psql -h localhost -U contrib -d dbmapnik -f update.sql
psql -h localhost -U contrib -d dbmapnik -f select.sql
psql -h localhost -U contrib -d dbmapnik -f export.sql
