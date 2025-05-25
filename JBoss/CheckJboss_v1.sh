#!/bin/bash


ChkJBossStat () {
   echo "$ChkType"
   for jb in `cat Nodes.lst`
   do
       echo "### $jb ###"
   done
}

case $1 in
   all)
     ChkType="all"
     ChkJBossStat
     ;;
   custom)
     ChkType="custom"
     ChkJBossStat
     ;;
   *)
     echo "Usage: sh $0 {all|custom}"
     ;;
esac
