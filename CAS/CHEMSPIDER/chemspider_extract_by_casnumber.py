# use of the ChemSpider APIs requires an account and associated token
# enter your token below, and rename this file to 'private_token.py'
# example of private_token.py content: 
# TOKEN = 'd04e5943-13bd-4215-81a3-e981eec38a1f'

#usage: chemspider_extract_by_casnumber.py 'cosing' 'casnumber'
#example: python chemspider_extract_by_casnumber.py  31367 58-61-7

import chemspipy

import sys


class Logger(object):
    def __init__(self, filename="Default.log"):
        self.terminal = sys.stdout
        self.log = open(filename, "a")

    def write(self, message):
        self.terminal.write(message)
        self.log.write(message)

sys.stdout = Logger("log.txt")

cas=sys.argv[1]
cos=sys.argv[2]

c_1 = chemspipy.find(cas)
if c_1:
    print c_1
    b=len(c_1)
    for i in range(0, b):
        print("%s\t%s\t%s\t%s\t%s\t%s"%(cos, cas, c_1[i].smiles, c_1[i].inchi, c_1[i].inchikey, c_1[i].commonname)) 
else:
    print("%s\t%s"%(cos,cas)) 

