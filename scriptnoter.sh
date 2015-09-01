#!/bin/bash
# Transcript to Note Converter Script 
# Vanessa Anderson OMSCS
# August 31 2005


echo "******* LOADING FILES ******* "
echo "Transcripts to process:"
srts="$1*.srt"
echo $srts


path=${1%/*}  # get the part after the last slash
name="/temp.txt"
echo "******* TRASHING OLD NOTES ******* "
rm -f "$path/temp.txt"
rm -f "$path$name"
rm -f "$path/new.doc"

read -n1 -r -p "Press any key to continue..." key


ellipse="..."
echo " ******* COMPILING NOTES ******* "




for file in $1*
do

 NAME=${file##*/}  # get the part after the last slash
 NAME=${NAME%.*}  # get the part before the colon
 
 
 echo $NAME >> $path$name
 echo "" >> $path$name
 echo "" >> $path$name
 
result=$(egrep -v -h '\b\d{1}[:.]?\d{2}[:.]?\d{2}[\.]?\d{3},\d{1}[:.]?\d{2}[:.]?\d{2}[\.]?\d{3}\b' "$file") 

  echo $result >> $path$name
  echo "" >> $path$name
  echo "" >> $path$name
  echo $ellipse
  ellipse=$ellipse"."
done

chmod 777 $path
tr -d '\r' < $path$name > $path"/notes.txt"

textutil -convert doc $path"/notes.txt"
rm -f "$path/notes.txt"
open ${1%/*}"/notes.doc"

echo "******* TRANSCRIPT CONVERSION COMPLETE ******* "
echo "      Result written to: $path" 
