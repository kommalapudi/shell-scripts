#!/bin/bash

STARTTIME=$(date)

echo "Script executed at: $STARTTIME"

sleep 5

ENDTIME=$(date)

echo "Script completed at: $ENDTIME"

TOTALTIME=$(( $(date -d "$ENDTIME" +%s) - $(date -d "$STARTTIME" +%s) ))
echo "Total execution time: $TOTALTIME seconds"

