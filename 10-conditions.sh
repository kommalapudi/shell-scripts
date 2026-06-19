#!/bin/bash

NUMBER=$1

#-gt -> greater than
#-lt -> less than
#-eq -> equal to
#-ne -> not equal to
#-ge -> greater than or equal to
#-le -> less than or equal to
if [ $NUMBER -gt 20 ]; then
    echo "Given number $NUMBER is greater than 20."
fi
