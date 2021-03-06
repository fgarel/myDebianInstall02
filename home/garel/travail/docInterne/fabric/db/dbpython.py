#!/usr/bin/env python
# -*- coding: utf-8 -*-
# licence GPL
# $Id: $


"""This module's docstring summary line.


Utilisation de la connection à une base postgresql

On se connecte à une base postgresql en python grace au module psycopg2

See http://www.python.org/dev/peps/pep-0008/ for more PEP-8 details and
http://wwd.ca/blog/2009/07/09/pep-8-cheatsheet/ for an up-to-date version
of this cheatsheet.

Created on 26 janv. 2010

@author: garel
"""

__author__ = "Frédéric Garel <fgarel@free.fr>"
__date__ = "26 Jan 2010"
__version__ = "$Revision: 1.5 $"
__credits__ = """Thanks to ... for his help on this module"""

# import des modules dans un repertoire frere
import os, sys
sys.path.append(os.path.join(os.getcwd(), '..'))
from db.python import connectpython
from db.python import inputoutputpython
from db.python import manipulatepython

class DbPython():
    """ DbPython est une classe offrant les outils nécessaires pour 
    établir une connexion à une base de données postgresql
    importer exporter des données
    manipuler des données

    DbShell regoupe les méthode qui permettent de manipuler
    les données en shell (pgsql, shp2pgsql, fabric, ...)

    DbPython regroupe les méthodes qui permettent de manipuler
    les données en langage Python (pas de shell ni de fabric)
    """
    def __init__(self):
        """  initialisation de la classe
        """
        pass
        
    def __call__(self):
        """  appel de la clasee
        """
        #print 'call'
        self.test()

    def create_database(self, database=''):
        """ create_database est une methode
        Creation d'une base de données postgis
        """

    def drop_database(self):
        """ drop_database est une methode
        Suppression de la base
        """
        pass

    def test(self):
        """ methode pour test
        """
        print "DbPython.test"
        _connectpython = connectpython.ConnectPython()
        _connectpython.test()
        print "DbPython.test"
        _inputoutputpython = inputoutputpython.InputOutputPython()
        _inputoutputpython.test()
        print "DbPython.test"
        _manipulatepython = manipulatepython.ManipulatePython()
        _manipulatepython.test()
        print "DbPython.test"              

def main():
    """ main permet d'instancier un objet de la classe DbPython
    """
    # Creation de l'instance
    _mydbpython = DbPython()
    _mydbpython.test()

if __name__ == '__main__':
    main()

