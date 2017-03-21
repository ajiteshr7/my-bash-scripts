#!/usr/bin/env bash

## Program to make dataset,                               ##
## it makes a file named data followed no. of data in it. ##

# Provide json file followed by number of line you need

if [ $# -eq 2 ]
then
    n=`expr $2 + 1`
    fname=$1
    head -$n $fname > tmp.json
    tail -n +2 tmp.json > tmp2.json && mv tmp2.json tmp.json
    sed -i 's/.$//' tmp.json
    cat tmp.json | tr -d '\200-\377' > tmp2.json && mv tmp2.json tmp.json
    name="data"`expr $n - 1`
    mv tmp.json $name.json
else
    echo 'Error: Invalid arguments!'
    echo 'Usage: <filename> <no. of lines>'
fi
