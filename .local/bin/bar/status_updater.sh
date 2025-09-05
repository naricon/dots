#!/bin/bash

for pid in $(pidof -x "status_updater.sh"); do
    if [ $pid != $$ ]; then
        echo "$(date +"%F %T"): status_updater.sh is already running with PID $pid, killing"
        kill $pid
    fi
done

# Add an artificial sleep to wait for the IPC handler to be ready to process requests
sleep 0.5

SETSTATUS="duskc --ignore-reply run_command setstatus"

secs=0
while true; do

    $SETSTATUS 0 "$(date '+%d %B, %A %I:%M:%S %P' | tr '[:upper:]' '[:lower:]')" &

    if [ $((secs % 30)) = 0 ]; then
        $SETSTATUS 1 "$(systemstats)" &
    fi

    ((secs+=1))
    sleep 1
done
