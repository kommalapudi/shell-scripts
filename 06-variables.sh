#!/bin/bash

STARTTIME=$(date +%s)

echo "Script executed at: $STARTTIME"

sleep 5

ENDTIME=$(date +%s)

echo "Script completed at: $ENDTIME"

TOTALTIME=$(( ENDTIME - STARTTIME ))
echo "Total execution time: $TOTALTIME seconds"

