#!/bin/sh

# dans un premier temps, on installe les données géographiques
if [ ! -e ~/geodata/vecteur/world/ne_110m_admin_0_countries.shp ]
then
  #cd ~/geodata/vecteur/world/
  #./getdata.sh
  #cd $OLDPWD
  ./getdata.sh
fi


# puis on lance la génération de l'image
rm ~/geodata/raster/world/world.png
python tutorial1.py
echo "done"
