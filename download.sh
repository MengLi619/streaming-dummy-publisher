#!/usr/bin/env sh

mkdir sources

i=1
for source in `cat sources.txt`; do
  echo "download $source"
  wget "$source" -O sources/source$i
  i=$((i+1))
done
