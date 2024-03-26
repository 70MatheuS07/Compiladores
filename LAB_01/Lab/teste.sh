#!/bin/bash
IN=in
OUT=out01_c
EXE=./lab01
for infile in `ls $IN/*.ezl`; do
    base=$(basename $infile)
    outfile=$OUT/${base/.ezl/.out}
    echo $infile
    $EXE < $infile | diff -w $outfile -
done