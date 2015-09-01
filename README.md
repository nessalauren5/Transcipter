# Transcripter
Written to compile/comptact omscs transcripts (.srt) into notes

#Use
Run the script using 

```sudo ./scriptnoter.sh filepath```

The filepath should be set to the folder containing the srt files.
The end result will be stored in a file named notes.doc in the same directory and opened upon completion

To run the script for a multilevel directory of srt files:
```sudo ./scriptnoter.sh filepath modulename```

The end result will be stored in a file named modulename.doc in the top level directory and opened upon completion
The modulename.doc will have the notes from each subdirectory, and each subdirectory will have its own notes.doc file with the text for that module.


