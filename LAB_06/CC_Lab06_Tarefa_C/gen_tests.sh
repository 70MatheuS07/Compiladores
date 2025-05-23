#!/bin/bash

YEAR=$(pwd | grep -o '20..-.')
DATA=/home/nidrog/Compiladores/LAB_06/CC_Lab06_Tarefa_C
IN=$DATA/in
OUT=$DATA/out06_c

EXE=./lab06

for infile in `ls $IN/*.ezl`; do
    base=$(basename $infile)
    outfile=$OUT/${base/.ezl/.out}
    echo Running $base
    $EXE < $infile > $outfile
done
