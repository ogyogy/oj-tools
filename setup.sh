#!/bin/bash

CMDNAME=`basename $0`

usage() {
  echo "Usage: $CMDNAME [-c] [-d CONTEST] [-p]" 1>&2
  exit 1
}

while getopts cd:p OPT
do
  case $OPT in
    "c" ) FLG_C="TRUE" ;;
    "d" ) VALUE_D="$OPTARG" ;;
    "p" ) FLG_P="TRUE" ;;
      # * ) usage ;;
  esac
done

# [ "$FLG_D" != "TRUE" ] && usage
[ "$VALUE_D" = "" ] && usage

if [ "$FLG_C" = "TRUE" ]; then
  echo "Not yet implemented"
else
  mkdir -p ../atcoder/$VALUE_D
  problems=("a" "b" "c")
  for problem in "${problems[@]}"
    do
      DST=../atcoder/$VALUE_D/$problem
      mkdir -p $DST
      if [ "$FLG_P" = "TRUE" ]; then
        touch $DST/main.py
      else
        cp template.cpp $DST/main.cpp
      fi
      cp ../atcoder-scraper/dist/atcoder-scraper.exe $DST
      cp ../atcoder-scraper/setting.json $DST
    done
fi