#!/bin/bash

number=1
# -le flag check if number is less than 10
#is used to compared values
while [ $number -le 10 ]
do
    echo "$number"
    ((number++))
done


for i in {1..10}; do
    echo "$i"
done