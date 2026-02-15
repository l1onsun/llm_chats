#!/usr/bin/env bash
today=$(date +%Y-%m-%d)

for file in ./*; do
  [ -f "$file" ] || continue
  
  file_date=$(stat -c %y -- "$file" | cut -d' ' -f1)
  
  if [[ "$file_date" < "$today" ]]; then
    mkdir -p "./$file_date"
    mv -- "$file" "./$file_date/"
  fi
done
