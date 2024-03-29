#!/bin/bash

usage() {
  echo "Usage: $0 <column> [file.csv]"
  echo "If no file is specified, reads from standard input."
  1>&2; exit 1
}

if [ $# -lt 1 ]; then
  usage
fi

column=$1
file=$2

calculate_mean() {
  sum=0
  count=0

  while IFS= read -r value; do
    sum=$(echo "$sum + $value" | bc)
    ((count++))
  done

  
  if [ $count -gt 0 ]; then
    mean=$(echo "scale=2; $sum / $count" | bc)
    echo "Mean: $mean"
  else
    echo "No data to calculate mean."
  fi
}

if [ -z "$file" ]; then

  cut -d',' -f$column | tail -n +2 | calculate_mean
else
  if [ -f "$file" ]; then
    cut -d',' -f$column "$file" | tail -n +2 | calculate_mean
  else
    echo "File not found: $file"
    exit 2
  fi
fi
