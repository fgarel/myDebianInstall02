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
#import os, sys
#sys.path.append(os.path.join(os.getcwd(), '..'))
#from python import connectPython
#from python import inputOutputPython
#from python import manipulatePython
from fabric.api import run
from fabric.api import env
#from fabric.api import local

env.hosts = ['localhost', 
             '128.156.6.101', 
             '128.156.6.102', 
             '128.156.6.103', 
             'dsiappli14',
             '127.0.0.1']
env.roledefs = {
    'totem': ['128.156.6.101', 
              '128.156.6.102',
              '128.156.6.103'],
    'e-tem': ['128.156.6.105'],
    'postgresql': ['localhost', 
                   '128.156.6.101',
                   'dsiappli14']
    }
env.passwords = {'garel@127.0.0.1:22': 'Mie3Asie', 
                 'root@127.0.0.1:22': '12.07$adm,LI', 
                 'garel@128.156.6.101:22': 'Mie3Asie', 
                 'root@128.156.6.101:22': '12.07$adm,LI', 
                 'garel@128.156.6.102:22': 'Mie3Asie', 
                 'root@128.156.6.102:22': '12.07$adm,LI', 
                 'garel@128.156.6.103:22': 'Mie3Asie', 
                 'root@128.156.6.103:22': '12.07$adm,LI', 
                 'garel@dsiappli14:22': 'Mie3Asie', 
                 'root@dsiappli14:22': '12.07$adm,LI'}

class AptDate():
    """ AptDate est une classe offrant les outils nécessaires pour 
    manipuler des dates

    AptDate regoupe les méthodes qui permettent de manipuler
    les dates

    """
    def __init__(self):
        """  initialisation de la classe
        """
        env.no_agent = True
        env.disable_know_hosts = True
        env.no_keys = True
        #env.host = 'localhost'
        #env.user = 'garel'
        #env.password = 'Mie3Asie'
        #env.hosts = ['localhost', \
        #             '128.156.6.101', \
        #             '128.156.6.102', \
        #             '128.156.6.103', \
        #             '128.156.6.104', \
        #             'dsiappli14']
        #env.roledefs = {
        #    'totem': ['128.156.6.101', 
        #              '128.156.6.102',
        #              '128.156.6.103',
        #              '128.156.6.104'],
        #    'postgresql': ['localhost', 
        #                   '128.156.6.101',
        #                   'dsiappli14']
        #    }

        #env.passwords = {'garel@127.0.0.1:22': 'Mie3Asie', \
        #                 'root@127.0.0.1:22': '12.07$adm,LI', \
        #                 'garel@128.156.6.102:22': 'Mie3Asie', \
        #                 'root@128.156.6.102:22': '12.07$adm,LI', \
        #                 'garel@128.156.6.101:22': 'Mie3Asie'}
        
    def __call__(self):
        """  appel de la clasee
        """
        #print 'call'
        self.test()

    def show_date(self):
        """ show_date est une methode
        Affiche la date du système
        """
        #env.host_string = 'localhost'
        """
        env.hosts = ['localhost', 
                     '128.156.6.101', 
                     '128.156.6.102', 
                     '128.156.6.103', 
                     '128.156.6.104', 
                     'dsiappli14']
        env.roledefs = {
            'totem': ['128.156.6.101', 
                      '128.156.6.102',
                      '128.156.6.103',
                      '128.156.6.104'],
            'postgresql': ['localhost', 
                           '128.156.6.101',
                           'dsiappli14']
            }
        env.roles = ['totem']
        print("env.host = %s ; \
              env.user = %s ; \
              env.password = %s ; \
              env.host_string = %s \
              env.hosts = %s" 
              % (env.host, 
              env.user, 
              env.password, 
              env.host_string,
              env.hosts))
        """
        run('date')
        run('whoami')

    def test(self):
        """ methode pour test

        """
        #print "AptDate.test"
        #print("Executing on %s as %s with %s : host_string = %s" \
        #      % (env.host, env.user, env.password, env.host_string))
        #print "AptDate.test"
        #local('date')
        print "AptDate.test"
        self.show_date()
        print "AptDate.test"

def main():
    """ main permet d'instancier un objet de la classe DbPython
    """
    # Creation de l'instance
    _myaptdate = AptDate()
    #print "host = ", _myaptdate.env.host
    print("env.host = %s ; \
              env.user = %s ; \
              env.password = %s ; \
              env.host_string = %s \
              env.hosts = %s" 
              % (env.host, 
              env.user, 
              env.password, 
              env.host_string,
              env.hosts))
    _myaptdate.test()

if __name__ == '__main__':
    main()

