#!/bin/bash

# check if an argument was passed
if [ $# -eq 0 ]; then
  echo "Please provide an upper bound as an argument"
  exit 1
fi

upper_bound=$1

for i in $(seq 10 $upper_bound); do 
    python main.py "yolov-$i" "$i"
    echo $i
done