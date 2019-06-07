#!/bin/bash

CMDNAME=`basename $0`

usage() {
  echo "Usage: $CMDNAME [-c] [-p] [-d CONTEST]" 1>&2
  exit 1
}

while getopts cd:p OPT
do
  case $OPT in
    "c" ) FLG_C="TRUE" ;;
    "p" ) FLG_P="TRUE" ;;
    "d" ) VALUE_D="$OPTARG" ;;
      # * ) usage ;;
  esac
done

# [ "$FLG_D" != "TRUE" ] && usage
[ "$VALUE_D" = "" ] && usage

if [ "$FLG_C" = "TRUE" ]; then
  DIR=../codeforces/$VALUE_D
  mkdir -p $DIR
  problems=("a" "b" "c")
  for problem in "${problems[@]}"
    do
      DST=$DIR/$problem
      mkdir -p $DST
      if [ "$FLG_P" = "TRUE" ]; then
        touch $DST/main.py
      else
        cp template.cpp $DST/main.cpp
      fi
    done
else
  DIR=../atcoder/$VALUE_D
  mkdir -p $DIR
  problems=("a" "b" "c")
  for problem in "${problems[@]}"
    do
      DST=$DIR/$problem
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