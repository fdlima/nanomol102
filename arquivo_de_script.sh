#!/bin/bash
# Objetivo: executar formchk, e gerar os arquivos para a PES
# Programador: FDALima

formchk $1

name=`basename $1 .chk`

cubegen 0 Density=SCF ${name}.fchk ${name}.den.cub 0 h
cubegen 0 Potential=SCF ${name}.fchk ${name}.esp.cub 0 h

rm teste
~                                                                  
