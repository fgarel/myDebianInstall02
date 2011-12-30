#/bin/sh

# 1ere possibilite : un extrait de point
#head -n 100 ~/geodata/raster/litto3d/MNT/LaRochelle/larochelleL93.xyz > ~/geodata/raster/litto3d/MNT/LaRochelle/larochelleL93extract.xyz
#cat data_header_litto3D.txt ~/geodata/raster/litto3d/MNT/LaRochelle/larochelleL93extract.xyz > ~/geodata/raster/litto3d/MNT/LaRochelle/larochelleL93.sql

# 2de possibilite : tout les points
cat data_header_litto3D.txt ~/geodata/raster/litto3d/MNT/LaRochelle/larochelleL93.xyz > ~/geodata/raster/litto3d/MNT/laRochelle/larochelleL93.sql

# import
psql -h dsiappli14 -U fred -d litto3d -f ~/geodata/raster/litto3d/MNT/LaRochelle/larochelleL93.sql

# traitement
psql -h dsiappli14 -U fred -d litto3d -f traitement.sql

# export

#echo "info postgresql"
#ogrinfo PG:'host=dsiappli14 user=fred password=Mie3Asie dbname=litto3d' litto3d -so
echo "ogr2ogr ESRI Shapefile"
#ogr2ogr -overwrite -f "ESRI Shapefile" ~/geodata/raster/litto3d/MNT/LaRochelle/shp PG:'host=dsiappli14 user=fred password=Mie3Asie dbname=litto3d' -sql "select * from litto3d"
ogr2ogr -overwrite -f "ESRI Shapefile" ~/geodata/raster/litto3d/MNT/LaRochelle/shp PG:'host=dsiappli14 user=fred password=Mie3Asie dbname=litto3d' litto3d_v0500
ogr2ogr -overwrite -f "ESRI Shapefile" ~/geodata/raster/litto3d/MNT/LaRochelle/shp PG:'host=dsiappli14 user=fred password=Mie3Asie dbname=litto3d' litto3d_v0200
ogr2ogr -overwrite -f "ESRI Shapefile" ~/geodata/raster/litto3d/MNT/LaRochelle/shp PG:'host=dsiappli14 user=fred password=Mie3Asie dbname=litto3d' litto3d_v0100
ogr2ogr -overwrite -f "ESRI Shapefile" ~/geodata/raster/litto3d/MNT/LaRochelle/shp PG:'host=dsiappli14 user=fred password=Mie3Asie dbname=litto3d' litto3d_v0050
ogr2ogr -overwrite -f "ESRI Shapefile" ~/geodata/raster/litto3d/MNT/LaRochelle/shp PG:'host=dsiappli14 user=fred password=Mie3Asie dbname=litto3d' litto3d_v0020
ogr2ogr -overwrite -f "ESRI Shapefile" ~/geodata/raster/litto3d/MNT/LaRochelle/shp PG:'host=dsiappli14 user=fred password=Mie3Asie dbname=litto3d' litto3d_v0010
ogr2ogr -overwrite -f "ESRI Shapefile" ~/geodata/raster/litto3d/MNT/LaRochelle/shp PG:'host=dsiappli14 user=fred password=Mie3Asie dbname=litto3d' litto3d_v0005
ogr2ogr -overwrite -f "ESRI Shapefile" ~/geodata/raster/litto3d/MNT/LaRochelle/shp PG:'host=dsiappli14 user=fred password=Mie3Asie dbname=litto3d' litto3d_v0002
ogr2ogr -overwrite -f "ESRI Shapefile" ~/geodata/raster/litto3d/MNT/LaRochelle/shp PG:'host=dsiappli14 user=fred password=Mie3Asie dbname=litto3d' litto3d
#echo "info shape"
#cd shp
#ogrinfo ~/geodata/raster/litto3d/MNT/LaRochelle/shp/litto3d.shp litto3d -so
#ogrinfo ~/geodata/raster/litto3d/MNT/LaRochelle/shp/sql_statement.shp sql_statement -so
#cd $OLDPWD
echo "ogr2ogr Mapinfo File"
#ogr2ogr -overwrite -f "Mapinfo File" -dsco "FORMAT=MIF" ~/geodata/raster/litto3d/MNT/LaRochelle/map PG:'host=dsiappli14 user=fred password=Mie3Asie dbname=litto3d' -sql "select * from litto3d"
ogr2ogr -overwrite -f "Mapinfo File" -dsco "FORMAT=MIF" ~/geodata/raster/litto3d/MNT/LaRochelle/map PG:'host=dsiappli14 user=fred password=Mie3Asie dbname=litto3d'  litto3d_v0500
ogr2ogr -overwrite -f "Mapinfo File" -dsco "FORMAT=MIF" ~/geodata/raster/litto3d/MNT/LaRochelle/map PG:'host=dsiappli14 user=fred password=Mie3Asie dbname=litto3d'  litto3d_v0200
ogr2ogr -overwrite -f "Mapinfo File" -dsco "FORMAT=MIF" ~/geodata/raster/litto3d/MNT/LaRochelle/map PG:'host=dsiappli14 user=fred password=Mie3Asie dbname=litto3d'  litto3d_v0100
ogr2ogr -overwrite -f "Mapinfo File" -dsco "FORMAT=MIF" ~/geodata/raster/litto3d/MNT/LaRochelle/map PG:'host=dsiappli14 user=fred password=Mie3Asie dbname=litto3d'  litto3d_v0050
ogr2ogr -overwrite -f "Mapinfo File" -dsco "FORMAT=MIF" ~/geodata/raster/litto3d/MNT/LaRochelle/map PG:'host=dsiappli14 user=fred password=Mie3Asie dbname=litto3d'  litto3d_v0020
ogr2ogr -overwrite -f "Mapinfo File" -dsco "FORMAT=MIF" ~/geodata/raster/litto3d/MNT/LaRochelle/map PG:'host=dsiappli14 user=fred password=Mie3Asie dbname=litto3d'  litto3d_v0010
ogr2ogr -overwrite -f "Mapinfo File" -dsco "FORMAT=MIF" ~/geodata/raster/litto3d/MNT/LaRochelle/map PG:'host=dsiappli14 user=fred password=Mie3Asie dbname=litto3d'  litto3d_v0005
ogr2ogr -overwrite -f "Mapinfo File" -dsco "FORMAT=MIF" ~/geodata/raster/litto3d/MNT/LaRochelle/map PG:'host=dsiappli14 user=fred password=Mie3Asie dbname=litto3d'  litto3d_v0002
ogr2ogr -overwrite -f "Mapinfo File" -dsco "FORMAT=MIF" ~/geodata/raster/litto3d/MNT/LaRochelle/map PG:'host=dsiappli14 user=fred password=Mie3Asie dbname=litto3d'  litto3d
#echo "info mifmid"
#ogrinfo ~/geodata/raster/litto3d/MNT/LaRochelle/map/litto3d.mif litto3d -so
#ogrinfo ~/geodata/raster/litto3d/MNT/LaRochelle/map/sql_statement.mif sql_statement -so
