#!/bin/sh -e

for orig in orig/*.mp3; do
  base=$(basename "$orig")
  ffmpeg -y -i "$orig" -vn -ar 22050 -ac 1 -b:a 64k "64/${base}"
  ffmpeg -y -i "$orig" -vn -af "adelay=1000|1000" "pad/${base}"
done
