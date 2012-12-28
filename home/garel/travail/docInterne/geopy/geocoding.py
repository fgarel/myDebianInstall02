#!/usr/env/python
# -*- coding: utf-8 -*-

import os
import sys
import shutil
import codecs
from geopy import geocoders

import geopy.geocoders.google
from geopy.geocoders.google import GQueryError

#class geopy.geocoders.google.GTooManyQueriesError():
#    pass

#class geopy.geocoders.google.GQueryError():
#    pass

def geocode(src, zero, un, plusieurs, err):
    """Fonction pour geocoder

    Lit un fichier source, ligne par ligne, et donne les coordonnees en sortie
    et les ecrit dans un fichier destination
    """

    g = geocoders.Google(domain='maps.google.fr')

    numeroligne=0
    for line in src:
        line = line.rstrip('\n\r')
        item="La Rochelle, France"
        lat=46.160329
        lng=-1.151139
        numeroligne+=1
        try:
            nbreponse=0
            L=g.geocode(line.encode('ascii', 'replace'), exactly_one=False)
            if len(L) == 1:
                nbreponse+=1
                item, (lat, lng) = L[0]
                print u"%d|%d| line 1 : %s | item : %s |%5f|%5f" % (numeroligne, nbreponse, line, item, lat, lng)
                un.write(u"%d|%d|%s|%s|%5f|%5f\n" % (numeroligne, nbreponse, line, item, lat, lng))
            else:
                for item, (lat, lng) in L:
                    nbreponse+=1
                    print u"%d|%d| line + : %s | item : %s |%5f|%5f" % (numeroligne, nbreponse, line, item, lat, lng)
                    plusieurs.write(u"%d|%d|%s|%s|%5f|%5f\n" % (numeroligne, nbreponse, line, item, lat, lng))
        except TypeError:
            # pour info
            print "TypeError : ", sys.exc_info()[0]
        except AttributeError:
            # pour info
            print "AttributeError : ", sys.exc_info()[0]
        except UnicodeDecodeError:
            # erreur traitée
            # exemple de la rue des glaieuls dans le fichier de départ, en latin1 
            # lors de l'appel à la fonction geocode, il est nécessaire de traduire le mot glaieul lu dans le fichier de départ en latin 1, en ascci 
            print "UnicodeDecodeError : ", sys.exc_info()[0]
            print item.encode('utf-8', 'replace')
        except UnicodeEncodeError:
            # erreur traitée
            # exemple de la rue de fétilly
            # erreur au moment de l'ecriture dans les fichiers de sortie
            print "UnicodeEncodeError : ", sys.exc_info()[0]
            print line
            print line.encode('utf-8', 'replace')
            print line.encode('ascii', 'replace')
        except geopy.geocoders.google.GQueryError:
            # google ne renvoit aucune réponse : code postale ne correspondant pas à la commune, par exemple 
            print u"%d|%d| line 0 : %s | item : %s |%5f|%5f" % (numeroligne, nbreponse, line, item, lat, lng)
            zero.write(u"%d|%d|%s|%s|%5f|%5f\n" % (numeroligne, nbreponse, line, item, lat, lng))
        except geopy.geocoders.google.GTooManyQueriesError:
            # google, de manière aléatoire, ne renvoit pas l'info, avec comme prétexe, de limiter le nb de requete
            print u"%d|%d| line x : %s | item : %s |%5f|%5f" % (numeroligne, nbreponse, line, item, lat, lng)
            err.write(u"%d|%d|%s|%s|%5f|%5f\n" % (numeroligne, nbreponse, line, item, lat, lng))
        except ValueError:
            # pour info
            print u"ValueError : ", sys.exc_info()[0] 
            print u"%d|%d| line   : %s | item : %s |%5f|%5f" % (numeroligne, nbreponse, line, item, lat, lng)
        except: 
            # pour info
            print "Error  : ", sys.exc_info()[0]
            print u"%d|%d| line   : %s | item : %s |%5f|%5f" % (numeroligne, nbreponse, line, item, lat, lng)




def initialise():
    """
    initialisation du script : on prend les bons fihciers de départ
    """
    os.system("rm -f data01.csv")
    shutil.copy("/home/garel/f/vaccination/CartoVacLR2.csv", "data01.csv")
    os.system("rm -f data02.csv")
    os.system("tail -n+2 data01.csv > data02.csv")
    os.system("rm -f data03.csv")
    os.system("cut -f 1-4 -d ';' data02.csv > data03.csv")


if __name__ == "__main__":
    initialise()
    mon_fichier_ini = codecs.open("data03.csv", encoding="latin1", mode="r")
    mon_fichier_zero = codecs.open("data_zero.csv", encoding="utf-8", mode="w")
    mon_fichier_un = codecs.open("data_un.csv", encoding="utf-8", mode="w")
    mon_fichier_plusieurs = codecs.open("data_plusieurs.csv", encoding="utf-8", mode="w")
    mon_fichier_error = codecs.open("data_error.csv", encoding="utf-8", mode="w")
    geocode(mon_fichier_ini, mon_fichier_zero, mon_fichier_un, mon_fichier_plusieurs, mon_fichier_error)
    mon_fichier_error.close()
    mon_fichier_plusieurs.close()
    mon_fichier_un.close()
    mon_fichier_zero.close()
    mon_fichier_ini.close()

