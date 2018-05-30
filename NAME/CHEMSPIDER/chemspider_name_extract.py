#usage: python chemspider_name_extract.py 'cosing' 'name'
#example: python chemspider_name_extract.py 55191  "CALCIUM SULFATE HYDRATE "
import chemspipy

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
    chemspipy.find_one(name)
except AttributeError: 
    print("%s\t"%(cos))
else: 
       c_1 = chemspipy.find_one(name)
       if c_1:
          print("%s\t%s\t%s\t%s\t%s\t%s"%(cos, name, c_1.smiles, c_1.inchi, c_1.inchikey, c_1.commonname)) 
       else:
           print("%s\t"%(cos))
