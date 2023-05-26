#!/bin/bash
read -p "File:"  path
first=$(wc -l < $path )
namefile="$(basename $path)"
awk '{print $1}' $namefile | awk -F/ '{print $NF}' $namefile  >> filechanges.txt
awk '{print $1}' filechanges.txt >> filechanges2.txt
sort filechanges2.txt | uniq >> filechanges3.txt
second=$(wc -l < filechanges3.txt)
awk '{print $8}' $namefile | grep -v "NULL" $namefile >> filechanges4.txt
sort filechanges4.txt | uniq >> filechanges5.txt
third=$(wc -l < filechanges5.txt)
rm -r filech*
echo $first $second $third
