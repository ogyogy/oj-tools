#!/bin/bash

CMDNAME=`basename $0`

usage() {
  echo "Usage: $CMDNAME [-c] [-d CONTEST]" 1>&2
  exit 1
}

while getopts cd: OPT
do
  case $OPT in
    "c" ) FLG_C="TRUE" ;;
    "d" ) FLG_D="TRUE" ; VALUE_D="$OPTARG" ;;
      # * ) usage ;;
  esac
done

[ "$FLG_D" != "TRUE" ] && usage

if [ "$FLG_C" = "TRUE" ]; then
  echo "Not yet implemented"
else
  mkdir -p ../atcoder/$VALUE_D
  problems=("a" "b" "c")
  for problem in "${problems[@]}"
    do
      DST=../atcoder/$VALUE_D/$problem
      mkdir -p $DST
      cp template.cpp $DST/main.cpp
      cp ../atcoder-scraper/dist/atcoder-scraper.exe $DST
    done
fi