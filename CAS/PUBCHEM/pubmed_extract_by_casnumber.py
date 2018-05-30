#usage: python pubmed_extract_by_casnumber.py 'cosing' 'casnumber' 
#example python pubmed_extract_by_casnumber.py 31367 58-61-7
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

cas=sys.argv[2]
cos=sys.argv[1]

try:
   get_compounds(cas, 'name') 
except AttributeError:
   print("%s"%(cos))
else:
   cs = get_compounds(cas, 'name')
   print("%s\t%s\t%s\t%s\t"%(cos,cas,cs[0].iupac_name,cs[0].inchikey))
