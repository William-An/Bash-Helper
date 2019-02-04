#!/usr/bin/env bash

# Set delimiter to "\n"
IFS=$'\n'

home=/Users/william

# Directories you want to clean, use space for separation
dirsToClean=($home/Downloads/)

# Trash folder directory
trash=$home/.Trash

## Log Module\
# Log file dir
# LOGBase=/var/log/macCleaner
# LOG=$LOGBase-`date +%Y%m%d-%H%M%S`-.log

# Log counter
# logCounter=0
# logFlag=false
# gzip every week
# maxLogCount=3

# Initialization
echo "Directories to be cleaned: ${dirsToClean[@]}"

# Clean the dirs
for dir in "${dirsToClean[@]}"; do
    # Ignore hidden files and directories
    if `find $dir -mindepth 1 -not -path '*/\.*' | grep -q .`; then
        echo "Cleaning $dir at `date`"
        folder=$trash/`basename $dir`-`date +%Y%m%d-%H%M%S`/
        mkdir $folder
        for toClean in "$dir"*; do
            mv $toClean $folder
            echo "[`basename $dir`] Cleaned `basename $toClean` at `date`"
        done
        # Logfile written
        # logFlag=true
    fi
done
## Log zip
#let "logCounter+=1"
#if [[ $logCounter -ge maxLogCount ]] && $logFlag; then
#    gzip "$LOGBase"*[^.gz]
#    logCounter=0
#    logFlag=false
#fi
