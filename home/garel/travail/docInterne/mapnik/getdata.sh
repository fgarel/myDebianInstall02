#!/bin/sh

echo "Recuperation des données"
cd ~/geodata/vecteur/world/
rm -f 110m-admin-0-countries.zip.1
rm -f 110m-admin-0-countries.zip
wget https://github.com/mapnik/mapnik/wiki/data/110m-admin-0-countries.zip
echo A | unzip 110m-admin-0-countries.zip -d ~/geodata/vecteur/world/
cd $OLDPWD
