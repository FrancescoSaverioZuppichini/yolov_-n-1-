#!/bin/bash

# check if an argument was passed
if [ $# -eq 0 ]; then
  echo "Please provide an upper bound as an argument"
  exit 1
fi

upper_bound=$1

for i in $(seq 10 $upper_bound); do 
    project_name="yolov-$i"
    python main.py $project_name "$i"
    cd ./cookiecutter-output/$project_name
    echo $i
done