#To run the script you need to create a file named 'FILENAME' containing each CAS number on each line and run the script
#example: awk -f cactus_cas2smile.awk FILENAME
#where FILENAME is the file containing all cas numbers

BEGIN {
FS = "\t"
i=0
}

{
if ($1=="NULL") {
   printf "%s NULL\n",$1
                }
else {
"curl -s https://cactus.nci.nih.gov/chemical/structure/"$1"/smiles" | getline smiles 
"curl -s https://cactus.nci.nih.gov/chemical/structure/"$1"/stdinchikey" | getline inchikey
close("curl -s https://cactus.nci.nih.gov/chemical/structure/"$1"/smiles")
close("curl -s https://cactus.nci.nih.gov/chemical/structure/"$1"/stdinchikey")
if (smiles=="") {smiles="NULL"}
if (inchikey=="") {inchikey="NULL"}
printf "%s\t%s\t%s\n",$1,smiles,substr(inchikey,10,27)
      }
smiles="NULL" 
inchikey="NULL"
}
