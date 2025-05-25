#!/bin/bash
threshold=75

eval df -PTh | tr -d '%' | awk '{ if ( $6 > $threshold) print $0}'
#eval $criticalfs
