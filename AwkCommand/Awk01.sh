#!/bin/sh
cat Employee.txt | awk -F " " 'BEGIN {OFS="-"} {print $1,$3}'
