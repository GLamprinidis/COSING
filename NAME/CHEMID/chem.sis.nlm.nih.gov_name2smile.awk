#To run the script you need to crate a file 'FILENAME' containing each name (inci-name or iupac-name) on each line and run the script
#awk -f chem.sis.nlm.nih.gov_name2smile.awk FILENAME
#where FILENAME is the file containing all cas numbers
BEGIN {
FS = "\t"
}

{
if ($1=="") {
   printf "%s NULL\n",$1
                }
else {
"curl -s https://chem.nlm.nih.gov/chemidplus/name/"$1" | awk '/Smiles/{getline;print}' | head -1 | sed 's/<[^>]*>//g' | sed 's/\t//g'" | getline smiles
"curl -s https://chem.nlm.nih.gov/chemidplus/name/"$1" | awk '/inchikey=/{print}'" | getline inchikey
close("curl -s https://chem.nlm.nih.gov/chemidplus/name/"$1" | awk '/Smiles/{getline;print}' | head -1 | sed 's/<[^>]*>//g' | sed 's/\t//g'")
close("curl -s https://chem.nlm.nih.gov/chemidplus/name/"$1" | awk '/inchikey=/{print}'")
if (smiles=="") {smiles="NULL"}
if (inchikey=="") {inchikey="NULL"}
printf ("%s\t",$1)
printf ("%s\t",substr(inchikey,11,27))
printf ("%s\n",smiles)
      }
smiles="NULL" 
inchikey="NULL"
}
