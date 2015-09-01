#!/bin/bash
# Transcript to Note Converter Script 
# Vanessa Anderson OMSCS
# August 31 2005
echo "******* LOADING FILES ******* "
echo "Transcripts to process:"
srts="$1*.srt"
echo $srts


path=${1%/*}"/notes.txt"  # get the part after the last slash

echo "******* TRASHING OLD NOTES ******* "
rm -f "$path"

ellipse="..."
echo " ******* COMPILING NOTES ******* "

for file in $1*
do

 NAME=${file##*/}  # get the part after the last slash
 NAME=${NAME%.*}  # get the part before the colon
 
 
 echo $NAME >> notes.txt
 echo "" >> notes.txt
 echo "" >> notes.txt
 
result=$(egrep -v -h '\b\d{1}[:.]?\d{2}[:.]?\d{2}[\.]?\d{3},\d{1}[:.]?\d{2}[:.]?\d{2}[\.]?\d{3}\b' "$file") 
  echo $result >> notes.txt
  echo "" >> notes.txt
  echo "" >> notes.txt
  echo $ellipse
  ellipse=$ellipse"."
done

echo "******* TRANSCRIPT CONVERSION COMPLETE ******* "
echo "      Result written to: $path" 
