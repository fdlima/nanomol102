#!/bin/sh
#Objetivo: Mostrar frames para calculo DFT EPR
#Programador: Filipe, Rafael

# Parte 1: add hydrogens 
a=`pwd`

rm add_hydrogens*

touch add_hydrogens_ok.pml

seqa=`ls -lrt | grep -a "_cie" | awk -F " " '{print $9}' | sed "s/.pdb//g" `

for i in  ${seqa} ;
do
echo "$i";


cat > add_hydrogens.pml << EOF
load $a/$i.pdb
select bla, resn DC
h_add bla
save $a/$i.pdb,(($i))

EOF

cat add_hydrogens.pml >> add_hydrogens_ok.pml

done

echo "quit" >> add_hydrogens_ok.pml


/usr/bin/pymol add_hydrogens_ok.pml
