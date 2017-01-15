#!/bin/bash
source run_droplet.cfg

run()
{
    for file in $INPUT_DIR/*.*; 
        do 
            echo "Picked up $file";
            name_without_extension=$(echo $file | cut -f 1 -d '.')
            echo "Running droplet on $file ";
            eval "$DROPLET_PATH $file"
            mkdir $MOVE_DIR/$name_without_extension
            move_files $OUTPUT_DIR $MOVE_DIR/$name_without_extension
    done
}

move_files()
{
    SRC=$1
    DEST=$2
    for file in $SRC/*.*;
        do
            echo "Moving $file to $DEST";
            mv $file $DEST
    done
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

check_file()
{
    FILE=$1
    if [ ! -f "$FILE" ] 
    then 
        echo "File $file doesn't exists";
        exit
    fi
}

main()
{
    $INPUT_DIR=$1
    $DROPLET_PATH=$2
    $OUTPUT_PATH=$3
    $MOVE_DIR=$4
    check_path $INPUT_DIR
    check_path $OUTPUT_PATH
    check_path $MOVE_DIR
    check_file $DROPLET_PATH
    #run $INPUT_DIR $DROPLET_PATH $OUTPUT_DIR $MOVE_DIR
}


