#To run the script you need to create a file named 'FILENAME' containing the name (IUPAC NAME or INCI NAME) on each line and run the script
#example: awk -f cactus_names2smile.awk FILENAME
#where FILENAME is the file containing all names (IUPAC NAME of INCI NAME)
BEGIN {
FS = "\t"
}

{
if ($1=="NULL") {
   printf "NULL\n"
                }
else {
"curl -s curl -s https://cactus.nci.nih.gov/chemical/structure/\""$1"\"/smiles" | getline b
"curl -s curl -s https://cactus.nci.nih.gov/chemical/structure/\""$1"\"/stdinchikey" | getline c 
close("curl -s curl -s https://cactus.nci.nih.gov/chemical/structure/\""$1"\"/smiles")
close("curl -s curl -s https://cactus.nci.nih.gov/chemical/structure/\""$1"\"/stdinchikey")
if (b=="") {b="NULL"}
if (c=="") {c="NULL"}
if (b~"Page") {b="NULL"}
if (c~"Page") {c="NULL"}
printf "%s\t%s\t%s\n",$1,b,c
      }
b="NULL" 
}
