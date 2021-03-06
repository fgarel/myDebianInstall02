#!/usr/bin/env python
# -*- coding: utf-8 -*-
# licence GPL
# $Id: $


"""This module's docstring summary line.

This is a multi-line docstring. Paragraphs are separated with blank lines. 
Lines conform to 79-column limit. 

Module and packages names should be short, lower_case_with_underscores.

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
from fabric.api import local
#import re
from db.shell import connectshell
from db.shell import inputoutputshell
from db.shell import manipulateshell

class DbShell():
    """ DbShell est une classe offrant les outils nécessaires pour
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
        # creation d'un fichier de connexion belier d'apres un template : \
        #   c'est à dire personnalisation du fichier /etc/belier/localhost
    
        # execution du script belier : creation de la base
        #print database
        if database == "":
            # creation d'un fichier de connexion belier d'apres un template : \
            #   c'est à dire personnalisation du fichier /etc/belier/localhost
    
            # execution du script belier : creation de la base
            local('bel -e /etc/belier/localhost -d 1', \
                  capture=False)
            local('./localhost.sh' , capture=False)
            local('rm localhost.sh', capture=False)
        else:
            # ici, on fait au préalable un recherche remplace
            local('sed s/mydb/' + database + \
                  "/ /etc/belier/localhost > localhost", \
                  capture=False)
            local('bel -e localhost -d 1', \
                  capture=False)
            local('./localhost.sh' , capture=False)
            local('rm localhost.sh', capture=False)
            local('rm localhost', capture=False)

    def drop_database(self):
        """ drop_database est une methode
        Suppression de la base
        """
        pass

    def test(self):
        """ methode pour test
        """
        print "DbShell.test"
        _connectshell = connectshell.ConnectShell()
        _connectshell.test()
        print "DbShell.test"
        _inputoutputshell = inputoutputshell.InputOutputShell()
        _inputoutputshell.test()
        print "DbShell.test"
        _manipulateshell = manipulateshell.ManipulateShell()
        _manipulateshell.test()
        print "DbShell.test"    

def main():
    """ main permet d'instancier un objet de la classe DbShell
    """
    # Creation de l'instance
    _mydbshell = DbShell()
    _mydbshell.test()
    
if __name__ == '__main__':
    main()

