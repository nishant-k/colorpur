#!/bin/bash

run()
{
    echo "Reading from $INPUT_FILE and Renaming files in root dir: $CURRENT_DIR"
    while IFS=, read -r col1 col2 col3
        do
            path="'$CURRENT_DIR/$col1/$col2'"
            col3_trim=$(echo $col3 | sed -e 's/[\n\r]//g')
            final_name="'$CURRENT_DIR/$col1/$col3_trim.jpg'"
            echo "Renaming $path to $final_name"
            cmd="mv $path $final_name"
            eval $cmd
    done < $INPUT_FILE
}

check_file()
{
    FILE=$1
    if [ ! -f "$FILE" ]
    then
        echo "File $FILE doesn't exists";
    fi
}

check_file_exit()
{
    FILE=$1
    if [ ! -f "$FILE" ]
    then
        echo "File $FILE doesn't exists";
        exit
    fi
}

check_path()
{
    DIR=$1
    if [ ! -d "$DIR" ]
    then
        echo "Directory $DIR doesn't exists";
        exit
    fi
}

main()
{
    check_file_exit $INPUT_FILE
    check_path $CURRENT_DIR
    run
}

INPUT_FILE=$1
CURRENT_DIR='.'
if [ ! -z "$2" ]
  then
    CURRENT_DIR=$2
fi

main
