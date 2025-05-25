#!/bin/bash

cur_date=`date +%Y%m%d%H%M`
rep_type=""
rep_path="$cur_date_$rep_type"

genrep () {
  #Create Reports directory
  mkdir -p "$cur_date$rep_type" && echo "'$cur_date$rep_type' directory has been created..."
  echo -e "================\nFileSystems\n================"
  df -PTh | tee -a "$cur_date$rep_type"/df.out
  echo -e "================\nAll Services\n================"
  su - finadm -c "allservices status" | tee -a "$cur_date$rep_type"/allservices.out 
}

case $1 in
   before)
     rep_type="before"
     genrep
     ;;
   after)
     rep_type="after"
     genrep
     ;;
   *)
     echo "Usage: sh $0 {before|after}"
     ;;
esac
