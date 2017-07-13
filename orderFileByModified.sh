#!/usr/bin/env bash

i=1
OIFS="$IFS"
IFS=$'\n'
for file in `ls -tr *.mp4`
do
     mv "$file" "$i-$file"
     i=`expr $i + 1`
done
IFS="$OIFS"
