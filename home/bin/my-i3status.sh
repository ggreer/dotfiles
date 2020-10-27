#!/usr/bin/env bash

DIFF_DAYS=""

death_clock () {
  DEATH_DATE=$(date --date '2065-03-17 -u' +%s)
  TODAY=$(date +%s)
  DIFF=$(expr "$DEATH_DATE" - "$TODAY")
  DIFF_DAYS=$(expr "$DIFF" / $(expr 24 \* 3600))
}

death_clock

i3status | (read line; echo "$line"; read line ; echo "$line" ; read line ; echo "$line" ; while true
do
  read line
  death_clock
  echo ",[{\"full_text\":\"☠️ ${DIFF_DAYS} days\", \"separator_block_width\": 20 },${line#,\[}" || exit 1
done)
