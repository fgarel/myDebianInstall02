#! /usr/bin/env python
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
from db import dbpython
from db import dbshell

class Majic():
    """ Majic est une classe offrant de nombreuses méthodes
    permettant de manipuler
    aisement les données stockées dans une base de données 
    posgresql avec l'extension postgis

    """
    def __init__(self):
        """  initialisation de la clasee
        """
        #print 'init'
        pass
        
    def __call__(self):
        """  appel de la clasee
        """
        #print 'call'
        self.test()
                
    def do_all(self):
        """ do_all est une méthode
        pour la manipulation des fichiers majic de la dgfip
        """
        #create_database('majic')
        #csv2pgsql('data_header.sql', 'data.txt')
        self.test()

    def test(self):
        """ methode pour test
        """
        print "Majic.test"
        _dbpython = dbpython.DbPython()
        _dbpython.test()
        print "Majic.test"
        _dbshell = dbshell.DbShell()
        _dbshell.test()
        print "Majic.test"

def main():
    """ main permet d'instancier un objet de la classe Majic
    """
    # Creation de l'instance
    _majic = Majic()
    _majic.test()

if __name__ == '__main__':
    main()

