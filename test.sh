#!/bin/bash

in=(*.in)
out=(*.out)

for ((i=0; i<${#in[@]}; i++)); do
    echo "-----------------------------diff do caso teste ${in[$i]}-----------------------------"
    diff -s ${out[$i]} <(cat ${in[$i]} | make run)
done
