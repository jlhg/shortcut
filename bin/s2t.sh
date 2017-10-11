#!/bin/sh
# Convert simplified chinese to traditional chinese
# Require iconv and opencc

in_dir=$1
out_dir=$2

mkdir tmp

for i in $in_dir/*; do
  echo "Converting $i..."
  iconv -f utf-16le -t utf-8 "$i" >"tmp/$(basename "$i")"
  # iconv -f utf-8 -t utf-8 "$i" >"tmp/$(basename "$i")"

  if [ $? -eq 1 ]; then
    echo "Try gb18030..."
    iconv -f gb18030 -t utf-8 "$i" >"tmp/$(basename "$i")"
  fi

  if [ $? -eq 1 ]; then
    echo "Try big5..."
    iconv -f big5 -t utf-8 "$i" >"tmp/$(basename "$i")"
  fi

  if [ $? -eq 1 ]; then
    echo "Try utf-8..."
    iconv -f utf-8 -t utf-8 "$i" >"tmp/$(basename "$i")"
  fi

  if [ $? -eq 1 ]; then
    echo "Error."
    exit
  fi

  opencc -c s2twp.json -i "tmp/$(basename "$i")" -o "$out_dir/$(basename "$i")"
  echo "Done."
done
