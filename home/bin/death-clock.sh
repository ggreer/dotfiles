#!/usr/bin/env bash

DIFF_DAYS=""

death_clock () {
  DEATH_DATE=$(date --date '2065-03-17 -u' +%s)
  TODAY=$(date +%s)
  DIFF=$(expr "$DEATH_DATE" - "$TODAY")
  echo "☠️ $(expr "$DIFF" / $(expr 24 \* 3600)) days"
}

death_clock
