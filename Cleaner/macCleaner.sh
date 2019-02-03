#!/usr/bin/env bash

# Set delimiter to "\n"
IFS=$'\n'

# Directories you want to clean, use space for separation
dirsToClean=(~/Downloads/)

# Trash folder directory
trash=~/.Trash

# Cleaning period time, in seconds
cleanPeriod=12*3600  # 12 hrs

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

# Clean the dirs periodically
while true; do
    for dir in "${dirsToClean[@]}"; do
        # Ignore hidden files and directories
        if `find $dir -mindepth 1 -not -path '*/\.*' | grep -q .`; then
            # echo "Cleaning $dir at `date`" >> $LOG 2>&1
            folder=$trash/`basename $dir`-`date +%Y%m%d-%H%M%S`/
            mkdir $folder
            for toClean in "$dir"*; do
                mv $toClean $folder
                # echo "[`basename $dir`] Cleaned `basename $toClean` at `date`" >> $LOG 2>&1 
            done
            # Logfile written
            logFlag=true
        fi
    done
    sleep $cleanPeriod
    ## Log zip
    #let "logCounter+=1"
    #if [[ $logCounter -ge maxLogCount ]] && $logFlag; then
    #    gzip "$LOGBase"*[^.gz]
    #    logCounter=0
    #    logFlag=false
    #fi
done
