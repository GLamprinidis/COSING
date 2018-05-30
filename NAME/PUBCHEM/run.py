#example: python run.py 39895     "2-ETHYL-2-(3-METHYLBUT-2-ENYL)HEX-3-ENOL "

from pubchempy import *

import sys

#import getopt
#opts = getopt.getopt(sys.argv[1])

class Logger(object):
    def __init__(self, filename="Default.log"):
        self.terminal = sys.stdout
        self.log = open(filename, "a")

    def write(self, message):
        self.terminal.write(message)
        self.log.write(message)

sys.stdout = Logger("log.txt")

cos=sys.argv[1]
name=sys.argv[2]

try:
   get_compounds(name, 'name') 
except AttributeError:
   print("%s"%(cos))
else:
   cs = get_compounds(name, 'name')
   print("%s\t%s\t%s\t%s\t%s\t"%(cos,name,cs[0].canonical_smiles,cs[0].iupac_name,cs[0].inchikey))
