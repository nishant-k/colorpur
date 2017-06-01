#!/bin/bash
if [ $# -eq 0 ];
    then
        echo "Usage: sh del_files.sh <CSV FILEPATH CONTAINING FILES TO BE DELETED AS FIRST FIELD>"
        exit
fi

ROOT_PATH="/Users/AbhinavSingh/Desktop/TEST/Move"
FILE_NAME=$1

while IFS="," read f1 f2; 
do
    FILENAME="$ROOT_PATH/$f1"
    echo "Deleting:" $FILENAME
    rm -rf $FILENAME
done < $FILE_NAME
