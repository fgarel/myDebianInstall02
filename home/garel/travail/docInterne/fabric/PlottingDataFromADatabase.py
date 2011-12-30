#! /usr/bin/env python
# -*- coding: utf-8 -*-
# licence GPL
# $Id: $

"""module factorielle

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



from pylab import *

import os, sys
sys.path.append(os.path.join(os.getcwd(),'..'))

from db import connect

def main():
    """ Connection à une base et parcours d'une table
    
    connection à la base definie dans connect.py
    parcours de la table bureau_vote
    """
    # Connect to the database.
    module, conn = connect.connect_dbapi()
    
    cursor = conn.cursor()
    
    try:
        cursor.execute("""SELECT * from bureau_vote""")
        conn.commit()
    except:
        print("I can't select from table bureau_vote database,", \
              "check your isolation level.")
        sys.exit()

    rows = cursor.fetchall()

    print "\nShow me the databases:\n"
    for row in rows:
        print "   ", row[0], row[1], row[2]

    # make sure we're authenticated

if __name__ == '__main__':
    main()

