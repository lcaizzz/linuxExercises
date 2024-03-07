#!/bin/bash

sum=0
pattern="^[01]+$"
for number in {1000..2000}; do
    if [[ $number =~ $pattern ]]; then
	sum=$(($sum + $number))
    fi
done

echo $sum
