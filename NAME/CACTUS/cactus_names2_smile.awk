BEGIN {
FS = "\t"
i=0
}

{
if ($2=="NULL") {
   printf "%s NULL\n",$1
                }
else {
"curl -s curl -s https://cactus.nci.nih.gov/chemical/structure/\""$2"\"/smiles" | getline b
"curl -s curl -s https://cactus.nci.nih.gov/chemical/structure/\""$2"\"/stdinchikey" | getline c 
close("curl -s curl -s https://cactus.nci.nih.gov/chemical/structure/\""$2"\"/smiles")
close("curl -s curl -s https://cactus.nci.nih.gov/chemical/structure/\""$2"\"/stdinchikey")
if (b=="") {b="NULL"}
if (c=="") {c="NULL"}
if (b~"Page") {b="NULL"}
if (c~"Page") {c="NULL"}
printf "%s\t%s\t%s\n",$1,b,c
      }
b="NULL" 
}
