#!/bin/bash

rm -r five; ./five_dirs.sh

mkdir five

for i in {1..5}; do
  mkdir "five/dir$i"
  for j in {1..4}; do
    yes $j | head -n $j > "five/dir$i/file$j"
  done
done
