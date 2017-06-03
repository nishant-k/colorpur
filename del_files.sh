#!/bin/bash
ROOT_PATH="/Users/AbhinavSingh/Desktop/TEST/Move"
FILE_NAME="/Users/AbhinavSingh/Downloads/Rejected Designs.csv"

while IFS="," read f1 f2; 
do
    FILENAME="$ROOT_PATH/$f1"
    echo "Deleting:" $FILENAME
    rm -rf $FILENAME
done < $FILE_NAME
